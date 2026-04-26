#!/usr/bin/env bash
set -euo pipefail

# Usage: ./new-db.sh
# Supported dbtypes: mysql, postgres
# Prompts interactively for database type and name.

read -rp "Database type (mysql, postgres): " DB_TYPE
read -rp "Database name: " DB_NAME

if [[ -z "$DB_TYPE" || -z "$DB_NAME" ]]; then
  echo "Both database type and name are required."
  exit 1
fi

create_mysql_db() {
  echo "Creating MySQL database '$DB_NAME'..."
  mysql -h 127.0.0.1 -P 3306 -u root -e "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;"
  echo "MySQL database '$DB_NAME' created (or already exists)."
}

create_postgres_db() {
  echo "Creating PostgreSQL database '$DB_NAME'..."
  psql -h 127.0.0.1 -p 5432 -U postgres -c "CREATE DATABASE \"$DB_NAME\";" 2>/dev/null || echo "PostgreSQL database '$DB_NAME' already exists or created."
  echo "PostgreSQL database '$DB_NAME' created (or already exists)."
}

case "$DB_TYPE" in
  mysql)
    create_mysql_db
    ;;
  postgres|postgresql)
    create_postgres_db
    ;;
  *)
    echo "Unsupported dbtype: $DB_TYPE"
    echo "Supported: mysql, postgres"
    exit 1
    ;;
esac
