CREATE OR REPLACE VIEW user_list AS
SELECT id, name
FROM users
ORDER BY name;
