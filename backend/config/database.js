// backend/config/database.js - UPDATED to include number_died column in litters table
const mysql = require('mysql2/promise');
require('dotenv').config();

let pool = null;

// Create connection pool - FIXED: Removed invalid options
const createPool = () => {
  if (!pool) {
    pool = mysql.createPool({
      host: process.env.DB_HOST || 'localhost',
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 'kwetu_farm',
      waitForConnections: true,
      connectionLimit: 10,
      queueLimit: 0
    });
  }
  return pool;
};

// Get database connection
const getConnection = async () => {
  const pool = createPool();
  return await pool.getConnection();
};

// Initialize database and create tables
const initializeDatabase = async () => {
  let connection;
  
  try {
    console.log('🔄 Initializing database...');
    
    // Connect to MySQL without specifying database first
    connection = await mysql.createConnection({
      host: process.env.DB_HOST || 'localhost',
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      multipleStatements: true
    });

    console.log('✅ Connected to MySQL server');

    // Create database if it doesn't exist
    const dbName = process.env.DB_NAME || 'kwetu_farm';
    await connection.query(`CREATE DATABASE IF NOT EXISTS \`${dbName}\``);
    console.log(`✅ Database '${dbName}' created or already exists`);

    // Use the database
    await connection.query(`USE \`${dbName}\``);

    // Create employees table
    await createEmployeesTable(connection);

    // Create pig registration tables
    await createPigTables(connection);

    // Create breeding tables
    await createBreedingTables(connection);

    // Create sample admin account
    await createSampleAdmin(connection);

    console.log('🎉 Database initialization completed successfully!');
    return true;

  } catch (error) {
    console.error('❌ Database initialization failed:', error.message);
    
    // Provide specific error guidance
    if (error.code === 'ECONNREFUSED') {
      console.error('💡 MySQL server is not running. Please start MySQL service.');
    } else if (error.code === 'ER_ACCESS_DENIED_ERROR') {
      console.error('💡 Access denied. Please check your MySQL credentials in .env file.');
    } else if (error.code === 'ENOTFOUND') {
      console.error('💡 MySQL host not found. Please check DB_HOST in .env file.');
    }
    
    return false;
  } finally {
    if (connection) {
      await connection.end();
      console.log('🔌 Database connection closed');
    }
  }
};

// Create employees table
const createEmployeesTable = async (connection) => {
  const createTableSQL = `
    CREATE TABLE IF NOT EXISTS employees (
      id INT AUTO_INCREMENT PRIMARY KEY,
      full_name VARCHAR(255) NOT NULL,
      email VARCHAR(255) UNIQUE NOT NULL,
      phone_number VARCHAR(10) UNIQUE NOT NULL,
      id_number VARCHAR(8) UNIQUE NOT NULL,
      employee_code VARCHAR(6) UNIQUE NOT NULL,
      password VARCHAR(255) NOT NULL,
      role ENUM('admin', 'manager', 'employee', 'cashier', 'vet', 'waiting_approval') DEFAULT 'waiting_approval',
      status ENUM('active', 'suspended') DEFAULT 'suspended',
      department VARCHAR(100),
      position VARCHAR(100),
      hire_date DATE DEFAULT (CURDATE()),
      salary DECIMAL(10, 2),
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );
  `;

  await connection.query(createTableSQL);
  console.log('✅ Employees table created or verified');

  // Create indexes
  const indexes = [
    { name: 'idx_employees_role', column: 'role' },
    { name: 'idx_employees_status', column: 'status' },
    { name: 'idx_employees_code', column: 'employee_code' },
    { name: 'idx_employees_email', column: 'email' }
  ];

  for (const index of indexes) {
    try {
      await connection.query(`CREATE INDEX IF NOT EXISTS ${index.name} ON employees(${index.column})`);
      console.log(`✅ Index '${index.name}' created or verified`);
    } catch (indexError) {
      if (indexError.code === 'ER_DUP_KEYNAME') {
        console.log(`✅ Index '${index.name}' already exists`);
      } else {
        console.log(`⚠️ Error creating index '${index.name}': ${indexError.message}`);
      }
    }
  }
};

// Create pig registration tables - UPDATED with breeding_status
const createPigTables = async (connection) => {
  // Grown pigs table - UPDATED with breeding_status
  const grownPigsSQL = `
    CREATE TABLE IF NOT EXISTS grown_pigs (
      id INT AUTO_INCREMENT PRIMARY KEY,
      pig_id VARCHAR(10) UNIQUE NOT NULL,
      gender ENUM('male', 'female') NOT NULL,
      breed VARCHAR(50) NOT NULL,
      birth_date DATE NOT NULL,
      weight DECIMAL(5, 2) NOT NULL,
      location ENUM('farm_a', 'farm_b', 'farm_c', 'farm_d', 'farm_e', 'farm_f') NOT NULL,
      health_status ENUM('healthy', 'average', 'bad') DEFAULT 'healthy',
      health_reason TEXT,
      number_affected INT,
      breeding_status ENUM('available', 'breeding', 'pregnant', 'farrowed', 'weaning', 'retired') DEFAULT 'available',
      current_breeding_record_id INT NULL,
      is_purchased BOOLEAN DEFAULT FALSE,
      purchase_date DATE,
      registered_by INT,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      FOREIGN KEY (registered_by) REFERENCES employees(id),
      INDEX idx_breeding_status (breeding_status),
      INDEX idx_gender (gender),
      INDEX idx_pig_id (pig_id)
    );
  `;

  // Litters table - UPDATED to include number_died column
  const littersSQL = `
    CREATE TABLE IF NOT EXISTS litters (
      id INT AUTO_INCREMENT PRIMARY KEY,
      litter_id VARCHAR(10) UNIQUE NOT NULL,
      birth_date DATE NOT NULL,
      sow_id VARCHAR(50) NOT NULL,
      boar_id VARCHAR(50) NOT NULL,
      total_born INT NOT NULL,
      male_count INT NOT NULL,
      female_count INT NOT NULL,
      number_died INT DEFAULT 0,
      average_weight DECIMAL(5, 2) NOT NULL,
      piglet_status ENUM('farrowed', 'breastfeeding', 'castrated', 'weaning', 'batched') DEFAULT 'farrowed',
      location ENUM('farm_a', 'farm_b', 'farm_c', 'farm_d', 'farm_e', 'farm_f') NOT NULL,
      health_status ENUM('healthy', 'average', 'bad') DEFAULT 'healthy',
      health_reason TEXT,
      number_affected INT,
      registered_by INT,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      FOREIGN KEY (registered_by) REFERENCES employees(id)
    );
  `;

  // Batches table
  const batchesSQL = `
    CREATE TABLE IF NOT EXISTS batches (
      id INT AUTO_INCREMENT PRIMARY KEY,
      batch_id VARCHAR(10) UNIQUE NOT NULL,
      formation_date DATE NOT NULL,
      average_birth_date DATE,
      male_count INT NOT NULL,
      female_count INT NOT NULL,
      purpose ENUM('become_sows', 'slaughter', 'sale', 'undecided') NOT NULL,
      location ENUM('farm_a', 'farm_b', 'farm_c', 'farm_d', 'farm_e', 'farm_f') NOT NULL,
      health_status ENUM('healthy', 'average', 'bad') DEFAULT 'healthy',
      health_reason TEXT,
      number_affected INT,
      registered_by INT,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      FOREIGN KEY (registered_by) REFERENCES employees(id)
    );
  `;

  // Batch piglets relationship table
  const batchPigletsSQL = `
    CREATE TABLE IF NOT EXISTS batch_piglets (
      id INT AUTO_INCREMENT PRIMARY KEY,
      batch_id VARCHAR(10) NOT NULL,
      piglet_id VARCHAR(20) NOT NULL,
      litter_id VARCHAR(10) NOT NULL,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      FOREIGN KEY (batch_id) REFERENCES batches(batch_id),
      UNIQUE KEY unique_piglet_batch (batch_id, piglet_id)
    );
  `;

  // Manual piglets table (for manually entered piglets in batches)
  const manualPigletsSQL = `
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
   );
 `;

 await connection.query(grownPigsSQL);
 console.log('✅ Grown pigs table created or verified with breeding_status');

 await connection.query(littersSQL);
 console.log('✅ Litters table created or verified');

 await connection.query(batchesSQL);
 console.log('✅ Batches table created or verified');

 await connection.query(batchPigletsSQL);
 console.log('✅ Batch piglets table created or verified');

 await connection.query(manualPigletsSQL);
 console.log('✅ Manual piglets table created or verified');

 // Check if we need to add number_died column to existing litters table
 try {
   const [columns] = await connection.query(`
     SELECT COLUMN_NAME 
     FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE TABLE_SCHEMA = DATABASE() 
     AND TABLE_NAME = 'litters' 
     AND COLUMN_NAME = 'number_died'
   `);
   
   if (columns.length === 0) {
     console.log('🔄 Adding number_died column to existing litters table...');
     await connection.query(`
       ALTER TABLE litters 
       ADD COLUMN number_died INT DEFAULT 0 AFTER female_count
     `);
     console.log('✅ Added number_died column to litters table');
   }
 } catch (error) {
   console.log('ℹ️ number_died column already exists or migration not needed');
 }

 // Check if we need to add breeding_status column to existing table
 try {
   const [columns] = await connection.query(`
     SELECT COLUMN_NAME 
     FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE TABLE_SCHEMA = DATABASE() 
     AND TABLE_NAME = 'grown_pigs' 
     AND COLUMN_NAME = 'breeding_status'
   `);
   
   if (columns.length === 0) {
     console.log('🔄 Adding breeding_status column to existing grown_pigs table...');
     await connection.query(`
       ALTER TABLE grown_pigs 
       ADD COLUMN breeding_status ENUM('available', 'breeding', 'pregnant', 'farrowed', 'weaning', 'retired') DEFAULT 'available' AFTER number_affected,
       ADD COLUMN current_breeding_record_id INT NULL AFTER breeding_status,
       ADD INDEX idx_breeding_status (breeding_status)
     `);
     
     // Update existing female pigs to 'available' status
     await connection.query(`
       UPDATE grown_pigs 
       SET breeding_status = 'available' 
       WHERE gender = 'female' AND breeding_status IS NULL
     `);
     
     console.log('✅ Added breeding_status column and updated existing records');
   }
 } catch (error) {
   console.log('ℹ️ breeding_status column already exists or migration not needed');
 }
};

// Create breeding tables - UPDATED with litter_size column
const createBreedingTables = async (connection) => {
 // Breeding records table with enhanced statuses and litter_size
 const breedingRecordsSQL = `
   CREATE TABLE IF NOT EXISTS breeding_records (
     id INT AUTO_INCREMENT PRIMARY KEY,
     sow_id VARCHAR(10) NOT NULL,
     boar_id VARCHAR(10) NOT NULL,
     breeding_date DATE NOT NULL,
     expected_farrowing_date DATE NOT NULL,
     boar_source ENUM('own_farm', 'neighboring_farm', 'breeding_center', 'artificial_insemination', 'purchased_service', 'exchange_program', 'other') DEFAULT 'own_farm',
     notes TEXT,
     breeding_status ENUM('bred', 'confirmed_pregnant', 'due_soon', 'overdue', 'farrowed', 'failed') DEFAULT 'bred',
     actual_farrowing_date DATE NULL,
     litter_size INT NULL,
     registered_by INT,
     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     FOREIGN KEY (registered_by) REFERENCES employees(id),
     INDEX idx_sow_id (sow_id),
     INDEX idx_boar_id (boar_id),
     INDEX idx_breeding_date (breeding_date),
     INDEX idx_expected_farrowing_date (expected_farrowing_date),
     INDEX idx_breeding_status (breeding_status)
   );
 `;

 // Breeding schedule/calendar table for tracking important dates
 const breedingScheduleSQL = `
   CREATE TABLE IF NOT EXISTS breeding_schedule (
     id INT AUTO_INCREMENT PRIMARY KEY,
     breeding_record_id INT NOT NULL,
     event_type ENUM('breeding', 'pregnancy_check', 'farrowing_due', 'weaning_due') NOT NULL,
     event_date DATE NOT NULL,
     event_status ENUM('scheduled', 'completed', 'missed', 'cancelled') DEFAULT 'scheduled',
     notes TEXT,
     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     FOREIGN KEY (breeding_record_id) REFERENCES breeding_records(id) ON DELETE CASCADE,
     INDEX idx_event_date (event_date),
     INDEX idx_event_type (event_type),
     INDEX idx_event_status (event_status)
   );
 `;

 // Breeding performance tracking table
 const breedingPerformanceSQL = `
   CREATE TABLE IF NOT EXISTS breeding_performance (
     id INT AUTO_INCREMENT PRIMARY KEY,
     sow_id VARCHAR(10) NOT NULL,
     boar_id VARCHAR(10) NOT NULL,
     breeding_record_id INT NOT NULL,
     conception_rate DECIMAL(5,2) DEFAULT 0.00,
     litter_size INT DEFAULT 0,
     weaning_weight DECIMAL(5,2) DEFAULT 0.00,
     piglet_survival_rate DECIMAL(5,2) DEFAULT 0.00,
     farrowing_interval_days INT DEFAULT 0,
     performance_score DECIMAL(5,2) DEFAULT 0.00,
     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     FOREIGN KEY (breeding_record_id) REFERENCES breeding_records(id) ON DELETE CASCADE,
     INDEX idx_sow_performance (sow_id),
     INDEX idx_boar_performance (boar_id),
     INDEX idx_performance_score (performance_score)
   );
 `;

 await connection.query(breedingRecordsSQL);
 console.log('✅ Breeding records table created or verified');

 await connection.query(breedingScheduleSQL);
 console.log('✅ Breeding schedule table created or verified');

 await connection.query(breedingPerformanceSQL);
 console.log('✅ Breeding performance table created or verified');

 // Check if we need to add litter_size column to existing breeding_records table
 try {
   const [columns] = await connection.query(`
     SELECT COLUMN_NAME 
     FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE TABLE_SCHEMA = DATABASE() 
     AND TABLE_NAME = 'breeding_records' 
     AND COLUMN_NAME = 'litter_size'
   `);
   
   if (columns.length === 0) {
     console.log('🔄 Adding litter_size column to existing breeding_records table...');
     await connection.query(`
       ALTER TABLE breeding_records 
       ADD COLUMN litter_size INT NULL AFTER actual_farrowing_date
     `);
     console.log('✅ Added litter_size column to breeding_records');
   }
 } catch (error) {
   console.log('ℹ️ litter_size column already exists or migration not needed');
 }

 // Check if we need to add due_soon and overdue to existing breeding_status enum
 try {
   const [result] = await connection.query(`
     SELECT COLUMN_TYPE 
     FROM INFORMATION_SCHEMA.COLUMNS 
     WHERE TABLE_SCHEMA = DATABASE() 
     AND TABLE_NAME = 'breeding_records' 
     AND COLUMN_NAME = 'breeding_status'
   `);
   
   if (result && result.COLUMN_TYPE && !result.COLUMN_TYPE.includes('due_soon')) {
     console.log('🔄 Updating breeding_status enum to include due_soon and overdue...');
     await connection.query(`
       ALTER TABLE breeding_records 
       MODIFY COLUMN breeding_status ENUM('bred', 'confirmed_pregnant', 'due_soon', 'overdue', 'farrowed', 'failed') DEFAULT 'bred'
     `);
     console.log('✅ Updated breeding_status enum with new values');
   }
 } catch (error) {
   console.log('ℹ️ breeding_status enum already up to date or migration not needed');
 }
};

// Create sample admin account
const createSampleAdmin = async (connection) => {
 try {
   const bcrypt = require('bcrypt');
   const hashedPassword = await bcrypt.hash('admin123', 10);
   
   const adminSQL = `
     INSERT IGNORE INTO employees (
       full_name, email, phone_number, id_number, employee_code, 
       password, role, status, department, position, salary
     ) VALUES (
       'System Administrator', 'admin@kwetufarm.co.ke', '0700000000', 
       '12345678', 'ADM001', ?, 'admin', 'active', 'IT', 'System Administrator', 100000.00
     )
   `;
   
   await connection.query(adminSQL, [hashedPassword]);
   console.log('✅ Sample admin account created or verified');
 } catch (error) {
   console.log('⚠️ Could not create sample admin:', error.message);
 }
};

// Health check function
const checkDatabaseHealth = async () => {
 try {
   const pool = createPool();
   const connection = await pool.getConnection();
   await connection.query('SELECT 1');
   connection.release();
   console.log('💚 Database health check: OK');
   return true;
 } catch (error) {
   console.error('❤️ Database health check: FAILED', error.message);
   return false;
 }
};

// Query helper function
const query = async (sql, params = []) => {
 const pool = createPool();
 try {
   const [results] = await pool.execute(sql, params);
   return results;
 } catch (error) {
   console.error('Database query error:', error);
   throw error;
 }
};

// Close all connections
const closePool = async () => {
 if (pool) {
   await pool.end();
   pool = null;
   console.log('🔌 Database pool closed');
 }
};

// Legacy compatibility - for backward compatibility with existing code
const promisePool = {
 getConnection: getConnection,
 execute: async (sql, params) => {
   const pool = createPool();
   return await pool.execute(sql, params);
 },
 query: async (sql, params) => {
   const pool = createPool();
   return await pool.query(sql, params);
 }
};

module.exports = { 
 initializeDatabase, 
 checkDatabaseHealth, 
 getConnection, 
 query, 
 closePool,
 pool: createPool,
 promisePool  // For backward compatibility
};