#!/bin/bash
set -e

echo "🚀 Running Database Initialization..."

# Max attempts before failing
ATTEMPTS=30
while ! pg_isready -U postgres -h localhost -p 5432 > /dev/null 2>&1 && [ $ATTEMPTS -gt 0 ]; do
  echo "⏳ Waiting for PostgreSQL to be ready... ($ATTEMPTS attempts left)"
  sleep 2
  ((ATTEMPTS--))
done

if [ $ATTEMPTS -eq 0 ]; then
  echo "❌ PostgreSQL did not start in time. Exiting."
  exit 1
fi

echo "✅ PostgreSQL is ready! Running initialization..."

# Run the init scripts ONCE
if [ ! -f /var/lib/postgresql/data/.init_done ]; then
  echo "✅ Running init scripts..."
  psql -U postgres -d test_db -f /docker-entrypoint-initdb.d/01_init_schema.sql
  psql -U postgres -d test_db -f /docker-entrypoint-initdb.d/02_init_data.sql

  touch /var/lib/postgresql/data/.init_done
  echo "✅ Init scripts completed. Moving them to prevent re-execution."
else
  echo "✅ Database already initialized. Skipping."
fi

