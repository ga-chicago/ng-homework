--run this file wtih psql -a -f db/migrations.sql

CREATE DATABASE kennel;

\c kennel;

CREATE TABLE doggos (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	age INT,
	breed VARCHAR(255),
	owner VARCHAR(255)
);

