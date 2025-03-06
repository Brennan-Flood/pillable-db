DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);


INSERT INTO users (name) VALUES ('Brennan'), ('Han');