CREATE DATABASE bedu_test;
DROP DATABASE bedu_test;

CREATE DATABASE IF NOT EXISTS bedu_test;
DROP DATABASE IF EXISTS bedu_test;

USE bedu_test;

CREATE TABLE IF NOT exists users (
	id INT PRIMARY KEY,
    genero CHAR(1),
    edad INT,
    ocupacion INT,
    cp VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS movies (
   id INT PRIMARY KEY, 
   title VARCHAR(80), 
   generos VARCHAR(80)
); 

CREATE TABLE IF NOT EXISTS ratings (
   userid INT, 
   movieid INT, 
   rating INT, 
   time_stamp BIGINT
);

DROP TABLE IF EXISTS users;

SELECT * FROM users;
SELECT * FROM movies;
SELECT * FROM ratings;

