echo "Running init scripts..."
psql -U postgres -d test_db -f /docker-entrypoint-initdb.d/init_schema.sql
psql -U postgres -d test_db -f /docker-entrypoint-initdb.d/init_data.sql
psql -U postgres -d test_db -f /docker-entrypoint-initdb.d/functions/add_user.sql
psql -U postgres -d test_db -f /docker-entrypoint-initdb.d/functions/get_users.sql
psql -U postgres -d test_db -f /docker-entrypoint-initdb.d/functions/delete_user.sql
psql -U postgres -d test_db -f /docker-entrypoint-initdb.d/views/user_view.sql
echo "Init scripts executed."