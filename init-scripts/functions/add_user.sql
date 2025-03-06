CREATE OR REPLACE FUNCTION add_user(username TEXT) RETURNS VOID AS $$
BEGIN
    INSERT INTO users (name) VALUES (username);
END;
$$ LANGUAGE plpgsql;