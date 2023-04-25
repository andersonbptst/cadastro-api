#!/usr/bin/env bash
echo "Loading database..."
psql -U postgres -c "CREATE DATABASE postgres"
pg_restore -v -d postgres /tmp/postgres.tar > /tmp/log
psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE postgres TO postgres"
echo "Database loaded successfully!"