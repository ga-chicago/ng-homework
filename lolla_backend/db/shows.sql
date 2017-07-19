--run this file with psql -a -f shows.sql

CREATE DATABASE shows;
\c shows;

CREATE TABLE sets(id SERIAL PRIMARY KEY, name VARCHAR(255), genre VARCHAR(255), stage VARCHAR(255), set_time VARCHAR(255));