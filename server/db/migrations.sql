--run this file with psql -a -f migrations.sql

CREATE DATABASE got;

\c got;

CREATE TABLE characters (id SERIAL PRIMARY KEY, first_name VARCHAR(255), last_name VARCHAR(255), house VARCHAR(255), dead BOOLEAN);