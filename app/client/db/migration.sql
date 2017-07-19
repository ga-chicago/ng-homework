--run this file with psql -a -f restaurants.sql

CREATE DATABASE chicagorestaurants;

\c chicagorestaurants;

--restaurants has many menu items
CREATE TABLE restaurants (id SERIAL PRIMARY KEY, name VARCHAR(255), address VARCHAR(255), cuisine_type VARCHAR(255), company VARCHAR(255));

--menu belongs to restaurants
CREATE TABLE menu (id SERIAL PRIMARY KEY, category VARCHAR(255), item_name VARCHAR(255), main_ingredient VARCHAR(255), price DECIMAL, menu_id INT references restaurants(id));

--menu_item belongs to menu and restaurants
CREATE TABLE reservation (id SERIAL PRIMARY KEY, restaurant_id INT references restaurants(id), menu_id INT references menu(id)); 


CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(255), password_digest VARCHAR(255), token BIGINT);

