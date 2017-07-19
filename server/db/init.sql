-- run as psql -a -f init.sql

CREATE DATABASE people;

\c people;

CREATE TABLE people (id SERIAL PRIMARY KEY, first_name VARCHAR(255), last_name VARCHAR(255), room_number INT, favorite_food VARCHAR(255));