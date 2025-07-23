const mysql = require('mysql2/promise');
require('dotenv').config();

const setupDatabase = async () => {
  let connection;
  
  try {
    console.log('🔄 Setting up database...');
    
    // Connect to MySQL without specifying database
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

    // Create indexes with error handling
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

    // Verify table structure
    const [tableInfo] = await connection.query('DESCRIBE employees');
    console.log(`✅ Employees table has ${tableInfo.length} columns`);

    // Count existing records
    const [countResult] = await connection.query('SELECT COUNT(*) as count FROM employees');
    const recordCount = countResult[0].count;
    console.log(`📊 Database contains ${recordCount} employee record(s)`);

    console.log('🎉 Database setup completed successfully!');
    console.log('📝 Database is ready for employee registrations');

  } catch (error) {
    console.error('❌ Database setup failed:', error.message);
    
    // Provide specific error guidance
    if (error.code === 'ECONNREFUSED') {
      console.error('💡 MySQL server is not running. Please start MySQL service.');
    } else if (error.code === 'ER_ACCESS_DENIED_ERROR') {
      console.error('💡 Access denied. Please check your MySQL credentials in .env file.');
    } else if (error.code === 'ENOTFOUND') {
      console.error('💡 MySQL host not found. Please check DB_HOST in .env file.');
    }
    
    throw error;
  } finally {
    if (connection) {
      await connection.end();
      console.log('🔌 Database connection closed');
    }
  }
};

// Additional utility function to check database health
const checkDatabaseHealth = async () => {
  let connection;
  try {
    connection = await mysql.createConnection({
      host: process.env.DB_HOST || 'localhost',
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 'kwetu_farm'
    });

    await connection.query('SELECT 1');
    console.log('💚 Database health check: OK');
    return true;
  } catch (error) {
    console.error('❤️ Database health check: FAILED', error.message);
    return false;
  } finally {
    if (connection) {
      await connection.end();
    }
  }
};

module.exports = { setupDatabase, checkDatabaseHealth };