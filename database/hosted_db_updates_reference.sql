-- =============================================================================
-- Farm Management System — hosted database alignment (reference script)
-- =============================================================================
-- ENGINE: MySQL 5.7+ / MariaDB 10.3+ (utf8mb4 recommended)
--
-- RECOMMENDED (safest): Point your production DB_CONFIG at this database and
-- start the Flask app once. The app runs create_database_and_tables(), which
-- creates missing tables/columns and runs numbered migrations in schema_migrations.
--
-- Use THIS FILE only if you must apply changes manually (e.g. no app access).
-- Many statements will ERROR if already applied — that is expected; skip those.
--
-- Before anything: take a full backup (mysqldump).
-- Replace `your_database_name` below.
-- =============================================================================

-- USE your_database_name;

-- -----------------------------------------------------------------------------
-- 1) Migration tracker (used by the app — do not remove if app manages DB)
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS schema_migrations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    migration_name VARCHAR(255) NOT NULL UNIQUE,
    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- If you manually apply sections below, record them so the app does not repeat work:
-- INSERT IGNORE INTO schema_migrations (migration_name) VALUES
--   ('001_sync_columns'),
--   ('002_cow_breeding_ai'),
--   ('003_employee_webauthn');

-- -----------------------------------------------------------------------------
-- 2) Migration 001 — column sync (_migration_001_sync_columns in app.py)
--    Run only for columns that INFORMATION_SCHEMA shows as missing.
-- -----------------------------------------------------------------------------

-- pigs
-- ALTER TABLE pigs ADD COLUMN name VARCHAR(100) NULL AFTER tag_id;
-- ALTER TABLE pigs ADD COLUMN gender ENUM('male','female') NULL AFTER name;
-- ALTER TABLE pigs ADD COLUMN birth_date DATE NULL AFTER gender;
-- ALTER TABLE pigs ADD COLUMN pig_source ENUM('born','purchased') NOT NULL DEFAULT 'born' AFTER pig_type;
-- ALTER TABLE pigs ADD COLUMN breeding_status ENUM('young','available','served','pregnant') DEFAULT 'young' AFTER purpose;
-- ALTER TABLE pigs ADD COLUMN is_edited BOOLEAN DEFAULT FALSE AFTER updated_at;
-- If legacy column `sex` exists: ALTER TABLE pigs CHANGE sex gender ENUM('male','female');

-- pigs.status (full enum used by the app)
-- ALTER TABLE pigs MODIFY COLUMN status ENUM('active','sold','deceased','transferred','dead','slaughtered') DEFAULT 'active';

-- pigs.pig_type (must include batch + litter for current app)
-- ALTER TABLE pigs MODIFY COLUMN pig_type ENUM('grown_pig','piglet','litter','batch') NOT NULL;

-- pigs.breeding_status extended value
-- ALTER TABLE pigs MODIFY COLUMN breeding_status ENUM('young','available','served','pregnant','farrowed') DEFAULT 'young';

-- weight_records
-- ALTER TABLE weight_records ADD COLUMN litter_id INT NULL AFTER animal_id;
-- ALTER TABLE weight_records ADD COLUMN expected_weight DECIMAL(8,2) NULL AFTER weight;
-- ALTER TABLE weight_records ADD COLUMN weight_type ENUM('actual','expected') DEFAULT 'actual' AFTER expected_weight;
-- ALTER TABLE weight_records MODIFY COLUMN animal_id INT NULL;
-- Add FK litter_id if missing:
-- ALTER TABLE weight_records ADD CONSTRAINT fk_weight_records_litter FOREIGN KEY (litter_id) REFERENCES litters(id) ON DELETE CASCADE;

-- feeds
-- ALTER TABLE feeds ADD COLUMN animal_type VARCHAR(20) NOT NULL DEFAULT 'pig' COMMENT 'Animal this feed is for: pig, cow, or chicken';
-- ALTER TABLE feeds MODIFY COLUMN feed_type VARCHAR(100) NOT NULL;

-- feed_stock
-- ALTER TABLE feed_stock ADD COLUMN cost DECIMAL(12,2) DEFAULT NULL;

-- farrowing_records
-- ALTER TABLE farrowing_records ADD COLUMN dead_piglets INT DEFAULT 0;
-- ALTER TABLE farrowing_records ADD COLUMN weak_piglets INT DEFAULT 0;
-- ALTER TABLE farrowing_records ADD COLUMN notes TEXT;
-- ALTER TABLE farrowing_records ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- farrowing_activities
-- ALTER TABLE farrowing_activities ADD COLUMN weaning_weight DECIMAL(5,2) NULL COMMENT 'Weight at weaning (for weaning activity)';
-- ALTER TABLE farrowing_activities ADD COLUMN weaning_date DATETIME NULL COMMENT 'Date and time of weaning (for weaning activity)';
-- ALTER TABLE farrowing_activities ADD COLUMN completed_by INT NULL COMMENT 'Employee who completed the activity';
-- ALTER TABLE farrowing_activities ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER created_at;
-- ALTER TABLE farrowing_activities ADD CONSTRAINT fk_farrowing_activities_completed_by FOREIGN KEY (completed_by) REFERENCES employees(id);

-- farrowing_records_edit_history (if table exists)
-- ALTER TABLE farrowing_records_edit_history ADD COLUMN field_name VARCHAR(50) NOT NULL AFTER record_id;

-- chicken_production (if table exists)
-- ALTER TABLE chicken_production ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
-- ALTER TABLE chicken_production ADD COLUMN created_by INT NULL;

-- feed_settings — JSON (MySQL 5.7.8+ / MariaDB 10.2+)
-- ALTER TABLE feed_settings ADD COLUMN feeding_times JSON NULL;

-- slaughter / death / sale: allow pig_type = batch
-- ALTER TABLE slaughter_records MODIFY COLUMN pig_type ENUM('grown_pig','litter','batch') NOT NULL;
-- ALTER TABLE dead_pigs MODIFY COLUMN pig_type ENUM('grown_pig','litter','batch') NOT NULL;
-- ALTER TABLE sale_records MODIFY COLUMN pig_type ENUM('grown_pig','litter','batch') NOT NULL;

-- sale_records: legacy column removal (optional)
-- ALTER TABLE sale_records DROP COLUMN payment_method;

-- -----------------------------------------------------------------------------
-- 3) Litters — status enum and batch linking (from create_database_and_tables)
-- -----------------------------------------------------------------------------
-- If status enum still uses 'active', migrate data first:
-- UPDATE litters SET status = 'unweaned' WHERE status = 'active';
-- ALTER TABLE litters MODIFY COLUMN status ENUM('unweaned','weaned','sold','deceased','dead','slaughtered') DEFAULT 'unweaned';

-- ALTER TABLE litters ADD COLUMN health_status ENUM('healthy','sick','recovering','quarantine','critical','injured') NOT NULL DEFAULT 'healthy';
-- ALTER TABLE litters ADD COLUMN male_piglets INT NULL DEFAULT NULL AFTER alive_piglets;
-- ALTER TABLE litters ADD COLUMN female_piglets INT NULL DEFAULT NULL AFTER male_piglets;
-- ALTER TABLE litters ADD COLUMN litter_source ENUM('born','purchased') NOT NULL DEFAULT 'born' AFTER litter_id;
-- ALTER TABLE litters ADD COLUMN sow_breed VARCHAR(120) NULL DEFAULT NULL AFTER boar_id;
-- ALTER TABLE litters ADD COLUMN boar_breed VARCHAR(120) NULL DEFAULT NULL AFTER sow_breed;
-- SET FOREIGN_KEY_CHECKS=0;
-- ALTER TABLE litters MODIFY COLUMN farrowing_record_id INT NULL;
-- ALTER TABLE litters MODIFY COLUMN sow_id INT NULL;
-- SET FOREIGN_KEY_CHECKS=1;
-- ALTER TABLE litters ADD COLUMN batch_pig_id INT NULL DEFAULT NULL AFTER notes;
-- ALTER TABLE litters ADD CONSTRAINT fk_litters_batch_pig FOREIGN KEY (batch_pig_id) REFERENCES pigs(id) ON DELETE SET NULL;

-- -----------------------------------------------------------------------------
-- 4) Litter health + sale buyer contacts + WebAuthn
-- -----------------------------------------------------------------------------
-- CREATE TABLE IF NOT EXISTS litter_health_records (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     litter_id INT NOT NULL,
--     check_date DATE NOT NULL,
--     health_status ENUM('healthy','sick','recovering','quarantine','critical','injured') NOT NULL DEFAULT 'healthy',
--     notes TEXT,
--     weight_record_id INT NULL,
--     farrowing_activity_id INT NULL,
--     recorded_by INT NULL,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--     FOREIGN KEY (litter_id) REFERENCES litters(id) ON DELETE CASCADE,
--     FOREIGN KEY (weight_record_id) REFERENCES weight_records(id) ON DELETE SET NULL,
--     FOREIGN KEY (farrowing_activity_id) REFERENCES farrowing_activities(id) ON DELETE SET NULL,
--     INDEX idx_litter_health_litter (litter_id),
--     INDEX idx_litter_health_date (check_date)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- CREATE TABLE IF NOT EXISTS sale_buyer_contacts (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     phone_normalized VARCHAR(32) NOT NULL,
--     full_name VARCHAR(255) NOT NULL,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     last_used_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--     UNIQUE KEY uq_sbc_phone (phone_normalized)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Migration 003 — employee WebAuthn / passkeys
CREATE TABLE IF NOT EXISTS employee_webauthn_credentials (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    credential_id VARBINARY(1024) NOT NULL,
    public_key BLOB NOT NULL,
    sign_count INT UNSIGNED NOT NULL DEFAULT 0,
    label VARCHAR(128) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_used_at TIMESTAMP NULL DEFAULT NULL,
    INDEX idx_employee_webauthn_employee (employee_id),
    UNIQUE KEY uq_webauthn_cred_id (credential_id(255)),
    CONSTRAINT fk_webauthn_emp FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -----------------------------------------------------------------------------
-- 5) Migration 002 — cow breeding AI (nullable sire)
-- -----------------------------------------------------------------------------
-- ALTER TABLE cow_breeding ADD COLUMN breeding_method ENUM('natural','ai') NOT NULL DEFAULT 'natural' AFTER sire_id;
-- ALTER TABLE cow_breeding ADD COLUMN ai_breed VARCHAR(255) NULL AFTER breeding_method;
-- ALTER TABLE cow_breeding MODIFY COLUMN sire_id INT NULL;
-- ALTER TABLE calves MODIFY COLUMN sire_id INT NULL;

-- -----------------------------------------------------------------------------
-- 6) breeding_records legacy cleanup (if column exists)
-- -----------------------------------------------------------------------------
-- Optional data backfill for failed status — see app.py breeding_records.status migration.
-- ALTER TABLE breeding_records DROP COLUMN status;

-- -----------------------------------------------------------------------------
-- 7) Helpful indexes (app tries to create; safe to ignore duplicates)
-- -----------------------------------------------------------------------------
-- CREATE INDEX idx_employees_code ON employees(employee_code);
-- CREATE INDEX idx_employees_email ON employees(email);
-- CREATE INDEX idx_employees_status ON employees(status);
-- CREATE INDEX idx_employees_role ON employees(role);
-- CREATE INDEX idx_activity_log_date ON activity_log(created_at);

-- =============================================================================
-- END. For a full baseline schema, export from a fresh local run of the app or
-- compare with kwetufar_farm (9) DB.sql in the repo (may be older than app.py).
-- =============================================================================
