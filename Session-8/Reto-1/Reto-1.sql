CREATE DATABASE IF NOT EXISTS data_test;
USE data_test;

CREATE TABLE IF NOT exists position_starbucks (
	brand VARCHAR(200),
    store_number VARCHAR(200),
    store_name VARCHAR(200),
    ownership_type VARCHAR(200),    
    street_address VARCHAR(200),
    city VARCHAR(200),
    state_province VARCHAR(200),
    country VARCHAR(200),
    postcode VARCHAR(200),
    phone_number VARCHAR(200),
    time_zone VARCHAR(200),
    longitude DOUBLE,
    latitude DOUBLE
);

SELECT *, POW(POW(longitude - (-99.15), 2) + POW(latitude - (19.41),2), 0.5) AS distance 
FROM position_starbucks WHERE country = "MX" AND state_province = "DIF" ORDER BY distance LIMIT 1;









