SHOW DATABASES;
USE tienda;
SHOW TABLES;
DESCRIBE empleado;

#RETO 1
DESCRIBE articulo;
DESCRIBE puesto;
DESCRIBE venta;

#RETO 2
SELECT * FROM empleado WHERE id_empleado = 4;
SELECT * FROM puesto WHERE salario > 10000;
SELECT * FROM articulo WHERE precio > 1000 AND iva > 100;
SELECT * FROM venta WHERE id_articulo IN (135, 963) AND id_empleado IN (835, 369);

#RETO 3
SELECT * FROM puesto ORDER BY salario DESC LIMIT 5;

#EJERCICIOS
USE classicmodels;
SHOW TABLES;
DESCRIBE employees;
DESCRIBE customers;
DESCRIBE offices;
DESCRIBE orders;
SELECT lastName FROM employees;
SELECT lastName, firstName, jobTitle FROM employees;
SELECT * FROM employees;
SELECT * FROM offices;
SELECT * FROM orders;
SELECT * FROM customers;
SELECT lastName, firstName, jobTitle FROM employees WHERE jobTitle = 'Sales Rep';
SELECT lastName, firstName, jobTitle, officeCode FROM employees WHERE jobTitle = 'Sales Rep' AND officeCode = 1;
SELECT lastName, firstName, jobTitle, officeCode FROM employees WHERE jobTitle = 'Sales Rep' OR officeCode = 1;
SELECT lastName, firstName, officeCode FROM employees WHERE officeCode IN (1, 2, 3);
SELECT lastName, firstName, jobTitle FROM employees WHERE jobTitle !=  'Sales Rep';
SELECT lastName, firstName, officeCode FROM employees WHERE officeCode > 5;
SELECT lastName, firstName, officeCode FROM employees WHERE officeCode <= 4;
SELECT customerName, country, state FROM customers WHERE country = 'USA' and state = 'CA';
SELECT customerName, country, state, creditLimit FROM customers WHERE country = 'USA' AND state = 'CA' AND creditLimit > 100000;
SELECT customerName, country, state FROM customers WHERE country IN ('USA', 'France');
SELECT customerName, country, creditLimit FROM customers WHERE country IN ('USA', 'France') AND creditLimit > 10000;
SELECT officeCode, city, phone, country FROM offices WHERE country IN ('USA', 'France');
SELECT officeCode, city, phone, country FROM offices WHERE country NOT IN ('USA', 'France');
SELECT orderNumber, customerNumber, status, shippedDate FROM orders WHERE orderNumber IN (10165, 10287, 10310);
SELECT contactLastName, customerName FROM customers ORDER BY contactLastName;
SELECT contactLastName, customerName FROM customers ORDER BY contactLastName DESC;
SELECT customerNumber, customerName, creditLimit FROM customers ORDER BY creditLimit DESC LIMIT 5;
SELECT customerNumber, customerName, creditLimit FROM customers ORDER BY creditLimit LIMIT 5;




