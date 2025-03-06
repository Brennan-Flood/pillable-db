CREATE OR REPLACE FUNCTION delete_user(user_id INT) RETURNS VOID AS $$
BEGIN
    DELETE FROM users WHERE id = user_id;
END;
$$ LANGUAGE plpgsql;