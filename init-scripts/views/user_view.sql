CREATE OR REPLACE VIEW user_list AS
SELECT id, name, role
FROM users
ORDER BY name;
