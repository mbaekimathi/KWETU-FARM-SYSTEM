// backend/routes/pigs.js
const express = require('express');
const { query } = require('../config/database');
const { authenticateToken } = require('../middleware/auth');
const router = express.Router();

// Get next available IDs
router.get('/next-ids', authenticateToken, async (req, res) => {
  try {
    // Get next pig ID (P for new, E for edited)
    const [lastPig] = await query('SELECT pig_id FROM grown_pigs ORDER BY id DESC LIMIT 1');
    let nextPigId = 'P001';
    if (lastPig) {
      const lastNum = parseInt(lastPig.pig_id.substring(1));
      nextPigId = `P${String(lastNum + 1).padStart(3, '0')}`;
    }

    // Get next litter ID (L for new, M for edited)
    const [lastLitter] = await query('SELECT litter_id FROM litters ORDER BY id DESC LIMIT 1');
    let nextLitterId = 'L001';
    if (lastLitter) {
      const lastNum = parseInt(lastLitter.litter_id.substring(1));
      nextLitterId = `L${String(lastNum + 1).padStart(3, '0')}`;
    }

    // Get next batch ID (B for new, C for edited)
    const [lastBatch] = await query('SELECT batch_id FROM batches ORDER BY id DESC LIMIT 1');
    let nextBatchId = 'B001';
    if (lastBatch) {
      const lastNum = parseInt(lastBatch.batch_id.substring(1));
      nextBatchId = `B${String(lastNum + 1).padStart(3, '0')}`;
    }

    res.json({
      nextPigId,
      nextLitterId,
      nextBatchId
    });
  } catch (error) {
    console.error('Error getting next IDs:', error);
    res.status(500).json({ message: 'Failed to get next IDs' });
  }
});

// Generate edited ID
const generateEditedId = async (originalId, table, idColumn) => {
  const prefix = originalId.charAt(0);
  const number = originalId.substring(1);
  
  // Map original prefixes to edited prefixes
  const editPrefixMap = {
    'P': 'E', // Pig -> Edited pig
    'L': 'M', // Litter -> Modified litter  
    'B': 'C'  // Batch -> Changed batch
  };
  
  const editedPrefix = editPrefixMap[prefix] || 'X';
  const baseEditedId = `${editedPrefix}${number}`;
  
  // Check if this edited ID already exists
  const [existing] = await query(`SELECT ${idColumn} FROM ${table} WHERE ${idColumn} = ?`, [baseEditedId]);
  
  if (!existing) {
    return baseEditedId;
  }
  
  // If it exists, find the next available number with the edited prefix
  const [lastEdited] = await query(
    `SELECT ${idColumn} FROM ${table} WHERE ${idColumn} LIKE ? ORDER BY ${idColumn} DESC LIMIT 1`,
    [`${editedPrefix}%`]
  );
  
  if (lastEdited) {
    const lastNum = parseInt(lastEdited[idColumn].substring(1));
    return `${editedPrefix}${String(lastNum + 1).padStart(3, '0')}`;
  }
  
  return baseEditedId;
};

// Register grown pig
router.post('/grown-pig', authenticateToken, async (req, res) => {
  try {
    const {
      pigId, gender, breed, birthDate, weight, location,
      healthStatus, healthReason, numberAffected, isPurchased, purchaseDate
    } = req.body;

    const sql = `
      INSERT INTO grown_pigs (
        pig_id, gender, breed, birth_date, weight, location,
        health_status, health_reason, number_affected, is_purchased, 
        purchase_date, registered_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    await query(sql, [
      pigId, gender, breed, birthDate, weight, location,
      healthStatus, healthReason, numberAffected, isPurchased,
      purchaseDate, req.user.id
    ]);

    res.status(201).json({ 
      message: 'Grown pig registered successfully',
      pigId 
    });
  } catch (error) {
    console.error('Error registering grown pig:', error);
    if (error.code === 'ER_DUP_ENTRY') {
      res.status(400).json({ message: 'Pig ID already exists' });
    } else {
      res.status(500).json({ message: 'Failed to register grown pig' });
    }
  }
});

// Update grown pig
router.put('/grown-pig/:id', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const {
      pigId, gender, breed, birthDate, weight, location,
      healthStatus, healthReason, numberAffected, isPurchased, purchaseDate
    } = req.body;

    // Get the original pig data
    const [originalPig] = await query('SELECT pig_id FROM grown_pigs WHERE id = ?', [id]);
    if (!originalPig) {
      return res.status(404).json({ message: 'Grown pig not found' });
    }

    // Generate new edited ID if the ID was changed or use provided ID
    let finalPigId = pigId;
    if (pigId !== originalPig.pig_id) {
      // Check if user provided a custom ID or if we need to generate one
      if (pigId.startsWith('E') || pigId.startsWith('P')) {
        // User provided a custom ID, check if it exists
        const [existingPig] = await query('SELECT id FROM grown_pigs WHERE pig_id = ? AND id != ?', [pigId, id]);
        if (existingPig) {
          return res.status(400).json({ message: 'Pig ID already exists' });
        }
        finalPigId = pigId;
      } else {
        // Generate new edited ID
        finalPigId = await generateEditedId(originalPig.pig_id, 'grown_pigs', 'pig_id');
      }
    }

    const sql = `
      UPDATE grown_pigs SET
        pig_id = ?, gender = ?, breed = ?, birth_date = ?, weight = ?, location = ?,
        health_status = ?, health_reason = ?, number_affected = ?, 
        is_purchased = ?, purchase_date = ?, updated_at = CURRENT_TIMESTAMP
      WHERE id = ?
    `;

    const result = await query(sql, [
      finalPigId, gender, breed, birthDate, weight, location,
      healthStatus, healthReason, numberAffected, isPurchased,
      purchaseDate, id
    ]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Grown pig not found' });
    }

    res.json({ 
      message: 'Grown pig updated successfully',
      newPigId: finalPigId
    });
  } catch (error) {
    console.error('Error updating grown pig:', error);
    if (error.code === 'ER_DUP_ENTRY') {
      res.status(400).json({ message: 'Pig ID already exists' });
    } else {
      res.status(500).json({ message: 'Failed to update grown pig' });
    }
  }
});

// Delete grown pig
router.delete('/grown-pig/:id', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;

    const result = await query('DELETE FROM grown_pigs WHERE id = ?', [id]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Grown pig not found' });
    }

    res.json({ message: 'Grown pig deleted successfully' });
  } catch (error) {
    console.error('Error deleting grown pig:', error);
    res.status(500).json({ message: 'Failed to delete grown pig' });
  }
});

// Register litter
router.post('/litter', authenticateToken, async (req, res) => {
  try {
    const {
      litterId, birthDate, sowId, boarId, totalBorn, maleCount,
      femaleCount, averageWeight, pigletStatus, location,
      healthStatus, healthReason, numberAffected
    } = req.body;

    const sql = `
      INSERT INTO litters (
        litter_id, birth_date, sow_id, boar_id, total_born, male_count,
        female_count, average_weight, piglet_status, location,
        health_status, health_reason, number_affected, registered_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    await query(sql, [
      litterId, birthDate, sowId, boarId, totalBorn, maleCount,
      femaleCount, averageWeight, pigletStatus, location,
      healthStatus, healthReason, numberAffected, req.user.id
    ]);

    res.status(201).json({ 
      message: 'Litter registered successfully',
      litterId 
    });
  } catch (error) {
    console.error('Error registering litter:', error);
    if (error.code === 'ER_DUP_ENTRY') {
      res.status(400).json({ message: 'Litter ID already exists' });
    } else {
      res.status(500).json({ message: 'Failed to register litter' });
    }
  }
});

// Update litter
router.put('/litter/:id', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const {
      litterId, birthDate, sowId, boarId, totalBorn, maleCount,
      femaleCount, averageWeight, pigletStatus, location,
      healthStatus, healthReason, numberAffected
    } = req.body;

    // Get the original litter data
    const [originalLitter] = await query('SELECT litter_id FROM litters WHERE id = ?', [id]);
    if (!originalLitter) {
      return res.status(404).json({ message: 'Litter not found' });
    }

    // Generate new edited ID if the ID was changed
    let finalLitterId = litterId;
    if (litterId !== originalLitter.litter_id) {
      if (litterId.startsWith('M') || litterId.startsWith('L')) {
        // User provided a custom ID, check if it exists
        const [existingLitter] = await query('SELECT id FROM litters WHERE litter_id = ? AND id != ?', [litterId, id]);
        if (existingLitter) {
          return res.status(400).json({ message: 'Litter ID already exists' });
        }
        finalLitterId = litterId;
      } else {
        // Generate new edited ID
        finalLitterId = await generateEditedId(originalLitter.litter_id, 'litters', 'litter_id');
      }
    }

    const sql = `
      UPDATE litters SET
        litter_id = ?, birth_date = ?, sow_id = ?, boar_id = ?, total_born = ?, male_count = ?,
        female_count = ?, average_weight = ?, piglet_status = ?, location = ?,
        health_status = ?, health_reason = ?, number_affected = ?, 
        updated_at = CURRENT_TIMESTAMP
      WHERE id = ?
    `;

    const result = await query(sql, [
      finalLitterId, birthDate, sowId, boarId, totalBorn, maleCount,
      femaleCount, averageWeight, pigletStatus, location,
      healthStatus, healthReason, numberAffected, id
    ]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Litter not found' });
    }

    // Update batch_piglets table if litter_id changed
    if (finalLitterId !== originalLitter.litter_id) {
      await query('UPDATE batch_piglets SET litter_id = ? WHERE litter_id = ?', 
        [finalLitterId, originalLitter.litter_id]);
    }

    res.json({ 
      message: 'Litter updated successfully',
      newLitterId: finalLitterId
    });
  } catch (error) {
    console.error('Error updating litter:', error);
    if (error.code === 'ER_DUP_ENTRY') {
      res.status(400).json({ message: 'Litter ID already exists' });
    } else {
      res.status(500).json({ message: 'Failed to update litter' });
    }
  }
});

// Delete litter
router.delete('/litter/:id', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;

    // Start transaction
    const connection = await require('../config/database').getConnection();
    await connection.beginTransaction();

    try {
      // Get litter info first
      const [litter] = await connection.execute('SELECT litter_id FROM litters WHERE id = ?', [id]);
      
      if (!litter) {
        await connection.rollback();
        connection.release();
        return res.status(404).json({ message: 'Litter not found' });
      }

      // Delete related batch_piglets if any
      await connection.execute('DELETE FROM batch_piglets WHERE litter_id = ?', [litter.litter_id]);

      // Delete the litter
      await connection.execute('DELETE FROM litters WHERE id = ?', [id]);

      await connection.commit();
      connection.release();

      res.json({ message: 'Litter and related data deleted successfully' });
    } catch (error) {
      await connection.rollback();
      connection.release();
      throw error;
    }
  } catch (error) {
    console.error('Error deleting litter:', error);
    res.status(500).json({ message: 'Failed to delete litter' });
  }
});

// Create batch
router.post('/batch', authenticateToken, async (req, res) => {
  try {
    const {
      batchId, formationDate, selectedPiglets, averageBirthDate,
      maleCount, femaleCount, purpose, location,
      healthStatus, healthReason, numberAffected, manualPiglets
    } = req.body;

    // Start transaction
    const connection = await require('../config/database').getConnection();
    await connection.beginTransaction();

    try {
      // Insert batch
      const batchSQL = `
        INSERT INTO batches (
          batch_id, formation_date, average_birth_date, male_count,
          female_count, purpose, location, health_status, health_reason,
          number_affected, registered_by
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
      `;

      await connection.execute(batchSQL, [
        batchId, formationDate, averageBirthDate, maleCount,
        femaleCount, purpose, location, healthStatus, healthReason,
        numberAffected, req.user.id
      ]);

      // Insert batch piglets and update their status to 'batched'
      for (const pigletId of selectedPiglets) {
        const litterId = pigletId.startsWith('M') ? 'Manual' : pigletId.split('-')[0];
        
        const pigletSQL = `
          INSERT INTO batch_piglets (batch_id, piglet_id, litter_id)
          VALUES (?, ?, ?)
        `;
        await connection.execute(pigletSQL, [batchId, pigletId, litterId]);

        // Update litter status to 'batched' if from litter (not manual)
        if (!pigletId.startsWith('M')) {
          const updateLitterSQL = `
            UPDATE litters SET piglet_status = 'batched' 
            WHERE litter_id = ?
          `;
          await connection.execute(updateLitterSQL, [litterId]);
        }
      }

      // Save manual piglets if any
      if (manualPiglets && manualPiglets.length > 0) {
        // Create manual_piglets table if it doesn't exist
        const createManualPigletsTable = `
          CREATE TABLE IF NOT EXISTS manual_piglets (
            id INT AUTO_INCREMENT PRIMARY KEY,
            piglet_id VARCHAR(20) UNIQUE NOT NULL,
            batch_id VARCHAR(10) NOT NULL,
            gender ENUM('male', 'female') NOT NULL,
            birth_date DATE NOT NULL,
            location ENUM('farm_a', 'farm_b', 'farm_c', 'farm_d', 'farm_e', 'farm_f') NOT NULL,
            registered_by INT,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY (batch_id) REFERENCES batches(batch_id),
            FOREIGN KEY (registered_by) REFERENCES employees(id)
          )
        `;
        await connection.execute(createManualPigletsTable);

        const manualPigletSQL = `
          INSERT INTO manual_piglets (
            piglet_id, batch_id, gender, birth_date, location, registered_by
          ) VALUES (?, ?, ?, ?, ?, ?)
        `;
        
        for (const piglet of manualPiglets) {
          if (selectedPiglets.includes(piglet.id)) {
            await connection.execute(manualPigletSQL, [
              piglet.id, batchId, piglet.gender, piglet.birthDate, 
              piglet.location, req.user.id
            ]);
          }
        }
      }

      await connection.commit();
      connection.release();

      res.status(201).json({ 
        message: 'Batch created successfully',
        batchId 
      });
    } catch (error) {
      await connection.rollback();
      connection.release();
      throw error;
    }
  } catch (error) {
    console.error('Error creating batch:', error);
    if (error.code === 'ER_DUP_ENTRY') {
      res.status(400).json({ message: 'Batch ID already exists' });
    } else {
      res.status(500).json({ message: 'Failed to create batch' });
    }
  }
});

// Update batch
router.put('/batch/:id', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const {
      batchId, formationDate, averageBirthDate, purpose, location,
      healthStatus, healthReason, numberAffected
   } = req.body;

   // Get the original batch data
   const [originalBatch] = await query('SELECT batch_id FROM batches WHERE id = ?', [id]);
   if (!originalBatch) {
     return res.status(404).json({ message: 'Batch not found' });
   }

   // Generate new edited ID if the ID was changed
   let finalBatchId = batchId;
   if (batchId !== originalBatch.batch_id) {
     if (batchId.startsWith('C') || batchId.startsWith('B')) {
       // User provided a custom ID, check if it exists
       const [existingBatch] = await query('SELECT id FROM batches WHERE batch_id = ? AND id != ?', [batchId, id]);
       if (existingBatch) {
         return res.status(400).json({ message: 'Batch ID already exists' });
       }
       finalBatchId = batchId;
     } else {
       // Generate new edited ID
       finalBatchId = await generateEditedId(originalBatch.batch_id, 'batches', 'batch_id');
     }
   }

   const sql = `
     UPDATE batches SET
       batch_id = ?, formation_date = ?, average_birth_date = ?, purpose = ?, location = ?,
       health_status = ?, health_reason = ?, number_affected = ?, 
       updated_at = CURRENT_TIMESTAMP
     WHERE id = ?
   `;

   const result = await query(sql, [
     finalBatchId, formationDate, averageBirthDate, purpose, location,
     healthStatus, healthReason, numberAffected, id
   ]);

   if (result.affectedRows === 0) {
     return res.status(404).json({ message: 'Batch not found' });
   }

   // Update batch_piglets and manual_piglets tables if batch_id changed
   if (finalBatchId !== originalBatch.batch_id) {
     await query('UPDATE batch_piglets SET batch_id = ? WHERE batch_id = ?', 
       [finalBatchId, originalBatch.batch_id]);
     await query('UPDATE manual_piglets SET batch_id = ? WHERE batch_id = ?', 
       [finalBatchId, originalBatch.batch_id]);
   }

   res.json({ 
     message: 'Batch updated successfully',
     newBatchId: finalBatchId
   });
 } catch (error) {
   console.error('Error updating batch:', error);
   if (error.code === 'ER_DUP_ENTRY') {
     res.status(400).json({ message: 'Batch ID already exists' });
   } else {
     res.status(500).json({ message: 'Failed to update batch' });
   }
 }
});

// Delete batch
router.delete('/batch/:id', authenticateToken, async (req, res) => {
 try {
   const { id } = req.params;

   // Start transaction
   const connection = await require('../config/database').getConnection();
   await connection.beginTransaction();

   try {
     // Get batch info first
     const [batch] = await connection.execute('SELECT batch_id FROM batches WHERE id = ?', [id]);
     
     if (!batch) {
       await connection.rollback();
       connection.release();
       return res.status(404).json({ message: 'Batch not found' });
     }

     // Get all piglets in this batch to update litter statuses
     const piglets = await connection.execute('SELECT piglet_id, litter_id FROM batch_piglets WHERE batch_id = ?', [batch.batch_id]);

     // Update litter statuses back to previous state (assuming 'weaning')
     for (const piglet of piglets[0]) {
       if (piglet.litter_id !== 'Manual') {
         await connection.execute('UPDATE litters SET piglet_status = ? WHERE litter_id = ?', ['weaning', piglet.litter_id]);
       }
     }

     // Delete related records
     await connection.execute('DELETE FROM manual_piglets WHERE batch_id = ?', [batch.batch_id]);
     await connection.execute('DELETE FROM batch_piglets WHERE batch_id = ?', [batch.batch_id]);
     await connection.execute('DELETE FROM batches WHERE id = ?', [id]);

     await connection.commit();
     connection.release();

     res.json({ message: 'Batch and related data deleted successfully' });
   } catch (error) {
     await connection.rollback();
     connection.release();
     throw error;
   }
 } catch (error) {
   console.error('Error deleting batch:', error);
   res.status(500).json({ message: 'Failed to delete batch' });
 }
});

// Get available piglets for batching
router.get('/available-piglets', authenticateToken, async (req, res) => {
 try {
   const sql = `
     SELECT l.litter_id, l.birth_date, l.total_born, l.male_count, 
            l.female_count, l.piglet_status, l.location
     FROM litters l
     WHERE l.piglet_status != 'batched'
     ORDER BY l.birth_date DESC
   `;

   const litters = await query(sql);
   
   // Generate piglet list
   const piglets = [];
   litters.forEach(litter => {
     for (let i = 0; i < litter.total_born; i++) {
       const gender = i < litter.male_count ? 'male' : 'female';
       piglets.push({
         id: `${litter.litter_id}-${String(i + 1).padStart(2, '0')}`,
         litterId: litter.litter_id,
         gender: gender,
         birthDate: litter.birth_date,
         status: litter.piglet_status,
         location: litter.location
       });
     }
   });

   res.json(piglets);
 } catch (error) {
   console.error('Error getting available piglets:', error);
   res.status(500).json({ message: 'Failed to get available piglets' });
 }
});

// Get registration statistics
router.get('/statistics', authenticateToken, async (req, res) => {
 try {
   const [grownPigsCount] = await query('SELECT COUNT(*) as count FROM grown_pigs');
   const [littersCount] = await query('SELECT COUNT(*) as count FROM litters');
   const [batchesCount] = await query('SELECT COUNT(*) as count FROM batches');
   
   // Count available piglets (excluding batched ones)
   const [availablePigletsCount] = await query(`
     SELECT SUM(total_born) as count 
     FROM litters 
     WHERE piglet_status != 'batched'
   `);
   
   // Count total piglets (including batched ones)
   const [totalPigletsCount] = await query('SELECT SUM(total_born) as count FROM litters');

   res.json({
     grownPigs: grownPigsCount.count,
     litters: littersCount.count,
     batches: batchesCount.count,
     availablePiglets: availablePigletsCount.count || 0,
     totalPiglets: totalPigletsCount.count || 0
   });
 } catch (error) {
   console.error('Error getting statistics:', error);
   res.status(500).json({ message: 'Failed to get statistics' });
 }
});

// Get recent registrations
router.get('/recent/:type', authenticateToken, async (req, res) => {
 try {
   const { type } = req.params;
   let sql, table;

   switch (type) {
     case 'grown':
       table = 'grown_pigs';
       sql = `SELECT * FROM ${table} ORDER BY created_at DESC LIMIT 10`;
       break;
     case 'litter':
       table = 'litters';
       sql = `SELECT * FROM ${table} ORDER BY created_at DESC LIMIT 10`;
       break;
     case 'batch':
       table = 'batches';
       sql = `SELECT * FROM ${table} ORDER BY created_at DESC LIMIT 10`;
       break;
     default:
       return res.status(400).json({ message: 'Invalid type' });
   }

   const results = await query(sql);
   res.json(results);
 } catch (error) {
   console.error('Error getting recent registrations:', error);
   res.status(500).json({ message: 'Failed to get recent registrations' });
 }
});

// Get batch details with piglets
router.get('/batch/:batchId', authenticateToken, async (req, res) => {
 try {
   const { batchId } = req.params;

   // Get batch information
   const [batch] = await query('SELECT * FROM batches WHERE batch_id = ?', [batchId]);
   
   if (!batch) {
     return res.status(404).json({ message: 'Batch not found' });
   }

   // Get batch piglets
   const piglets = await query(`
     SELECT bp.piglet_id, bp.litter_id, l.birth_date, l.location
     FROM batch_piglets bp
     LEFT JOIN litters l ON bp.litter_id = l.litter_id
     WHERE bp.batch_id = ?
   `, [batchId]);

   // Get manual piglets if any
   const manualPiglets = await query(`
     SELECT piglet_id, gender, birth_date, location
     FROM manual_piglets
     WHERE batch_id = ?
   `, [batchId]);

   res.json({
     batch,
     piglets,
     manualPiglets
   });
 } catch (error) {
   console.error('Error getting batch details:', error);
   res.status(500).json({ message: 'Failed to get batch details' });
 }
});

// Update litter status
router.put('/litter/:litterId/status', authenticateToken, async (req, res) => {
 try {
   const { litterId } = req.params;
   const { status } = req.body;

   const validStatuses = ['farrowed', 'breastfeeding', 'castrated', 'weaning', 'batched'];
   
   if (!validStatuses.includes(status)) {
     return res.status(400).json({ message: 'Invalid status' });
   }

   const sql = 'UPDATE litters SET piglet_status = ? WHERE litter_id = ?';
   const result = await query(sql, [status, litterId]);

   if (result.affectedRows === 0) {
     return res.status(404).json({ message: 'Litter not found' });
   }

   res.json({ message: 'Litter status updated successfully' });
 } catch (error) {
   console.error('Error updating litter status:', error);
   res.status(500).json({ message: 'Failed to update litter status' });
 }
});

// Get litters by status
router.get('/litters/status/:status', authenticateToken, async (req, res) => {
 try {
   const { status } = req.params;
   
   const sql = `
     SELECT * FROM litters 
     WHERE piglet_status = ? 
     ORDER BY birth_date DESC
   `;
   
   const litters = await query(sql, [status]);
   res.json(litters);
 } catch (error) {
   console.error('Error getting litters by status:', error);
   res.status(500).json({ message: 'Failed to get litters by status' });
 }
});

// Get detailed statistics with breakdown
router.get('/statistics/detailed', authenticateToken, async (req, res) => {
 try {
   // Basic counts
   const [grownPigsCount] = await query('SELECT COUNT(*) as count FROM grown_pigs');
   const [littersCount] = await query('SELECT COUNT(*) as count FROM litters');
   const [batchesCount] = await query('SELECT COUNT(*) as count FROM batches');
   
   // Piglet status breakdown
   const pigletStatusBreakdown = await query(`
     SELECT piglet_status, COUNT(*) as count, SUM(total_born) as total_piglets
     FROM litters 
     GROUP BY piglet_status
   `);
   
   // Health status breakdown
   const healthBreakdown = await query(`
     SELECT 
       'grown_pigs' as type,
       health_status,
       COUNT(*) as count
     FROM grown_pigs
     GROUP BY health_status
     UNION ALL
     SELECT 
       'litters' as type,
       health_status,
       COUNT(*) as count
     FROM litters
     GROUP BY health_status
     UNION ALL
     SELECT 
       'batches' as type,
       health_status,
       COUNT(*) as count
     FROM batches
     GROUP BY health_status
   `);

   // Location breakdown
   const locationBreakdown = await query(`
     SELECT 
       'grown_pigs' as type,
       location,
       COUNT(*) as count
     FROM grown_pigs
     GROUP BY location
     UNION ALL
     SELECT 
       'litters' as type,
       location,
       COUNT(*) as count
     FROM litters
     GROUP BY location
     UNION ALL
     SELECT 
       'batches' as type,
       location,
       COUNT(*) as count
     FROM batches
     GROUP BY location
   `);

   res.json({
     basic: {
       grownPigs: grownPigsCount.count,
       litters: littersCount.count,
       batches: batchesCount.count
     },
     pigletStatus: pigletStatusBreakdown,
     healthStatus: healthBreakdown,
     locationBreakdown: locationBreakdown
   });
 } catch (error) {
   console.error('Error getting detailed statistics:', error);
   res.status(500).json({ message: 'Failed to get detailed statistics' });
 }
});

module.exports = router;