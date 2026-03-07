"""
Database migrations module.
Ensures DB, tables, and columns exist on both local and hosted environments.
Tracks applied migrations so pulling from GitHub and deploying runs only new changes.

How to add a new migration (when you add a table/column and push to GitHub):
1. In app.py, define a function e.g. def _migration_002_my_change(cursor): ...
2. In that function use db_migrations.ensure_column(cursor, 'table', 'col', 'SPEC')
   or run raw cursor.execute("ALTER TABLE ...") / cursor.execute("CREATE TABLE ...").
3. Append ('002_my_change', _migration_002_my_change) to the MIGRATIONS list in create_database_and_tables().
4. Push to GitHub; on pull the host will run migrations and apply 002_my_change once.
"""
import re


def _validate_identifier(name):
    """Allow only safe table/column identifiers (alphanumeric + underscore)."""
    if not name or not re.match(r'^[a-zA-Z0-9_]+$', name):
        raise ValueError(f"Invalid identifier: {name!r}")


def ensure_column(cursor, table_name, column_name, column_spec, after_column=None):
    """
    Add column to table if it does not exist.
    Works for both local and hosted MySQL/MariaDB.
    """
    _validate_identifier(table_name)
    _validate_identifier(column_name)
    if after_column:
        _validate_identifier(after_column)

    cursor.execute("""
        SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = %s AND COLUMN_NAME = %s
    """, (table_name, column_name))
    if cursor.fetchone():
        return False  # already exists

    # column_spec is raw SQL (e.g. "VARCHAR(100) NULL") - no user input
    sql = f"ALTER TABLE `{table_name}` ADD COLUMN `{column_name}` {column_spec}"
    if after_column:
        sql += f" AFTER `{after_column}`"
    cursor.execute(sql)
    return True


def ensure_table_exists(cursor, table_name):
    """Return True if table exists, False otherwise."""
    _validate_identifier(table_name)
    cursor.execute("SHOW TABLES LIKE %s", (table_name,))
    return cursor.fetchone() is not None


def ensure_migrations_table(cursor):
    """Create schema_migrations table if it doesn't exist."""
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS schema_migrations (
            id INT AUTO_INCREMENT PRIMARY KEY,
            migration_name VARCHAR(255) NOT NULL UNIQUE,
            applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    """)


def get_applied_migrations(cursor):
    """Return set of applied migration names."""
    ensure_migrations_table(cursor)
    cursor.execute("SELECT migration_name FROM schema_migrations")
    return {row['migration_name'] for row in cursor.fetchall()}


def run_migrations(conn, migrations_list):
    """
    Run each migration that hasn't been applied yet.
    migrations_list: list of (migration_name, callable(cursor)).
    """
    cursor = conn.cursor()
    try:
        applied = get_applied_migrations(cursor)
        for name, fn in migrations_list:
            if name in applied:
                continue
            try:
                fn(cursor)
                cursor.execute(
                    "INSERT INTO schema_migrations (migration_name) VALUES (%s)",
                    (name,)
                )
                conn.commit()
                print(f"  Migration applied: {name}")
            except Exception as e:
                conn.rollback()
                print(f"  Migration failed: {name} - {e}")
                raise
    finally:
        cursor.close()
