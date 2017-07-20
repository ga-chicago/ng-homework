-- psql -a -f migrations.sql

CREATE DATABASE airline;

\c airline;

CREATE TABLE flights (id SERIAL PRIMARY KEY,
						origin VARCHAR(255),
						destination VARCHAR(255),
						dep_date DATE,
						arr_date DATE);

CREATE TABLE passengers (id SERIAL PRIMARY KEY,
						first_name VARCHAR(255), 
						last_name VARCHAR(255),
						email VARCHAR(255));