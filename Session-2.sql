USE tienda;
USE classicmodels;
SHOW TABLES;
DESCRIBE empleado;
DESCRIBE puesto;
DESCRIBE venta;
DESCRIBE employees;
DESCRIBE products;
DESCRIBE orderdetails;
DESCRIBE orders;

# RETO 1
# ¿Qué artículos incluyen la palabra Pasta en su nombre?
SELECT * FROM articulo WHERE nombre LIKE '%Pasta%';
# ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
SELECT * FROM articulo WHERE nombre LIKE '%Cannelloni%';
# ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
SELECT * FROM articulo WHERE nombre LIKE '%-%';
# ¿Qué puestos incluyen la palabra Designer?
SELECT * FROM puesto WHERE nombre LIKE '%Designer%';
# ¿Qué puestos incluyen la palabra Developer?
SELECT * FROM puesto WHERE nombre LIKE '%Developer%';

# RETO 2
# ¿Cuál es el promedio de salario de los puestos?
SELECT ROUND(AVG(salario), 2) AS 'Promedio salario' FROM puesto;
# ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT COUNT(*) AS 'total_pasta' FROM articulo WHERE nombre LIKE '%pasta%';
# ¿Cuál es el salario mínimo y máximo?
SELECT MIN(salario) AS 'Salario Minimo', MAX(salario) AS 'Salario Maximo' FROM puesto;
# ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT SUM(salario), COUNT(*) FROM puesto WHERE id_puesto > ((SELECT MAX(id_puesto) FROM puesto)-5);

# RETO 3
# ¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre, count(*) FROM puesto GROUP BY nombre;
# ¿Cuánto dinero se paga en total por puesto?
SELECT nombre, sum(salario) FROM puesto GROUP BY nombre;
# ¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado, count(*) FROM venta GROUP BY id_empleado;
# ¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, count(*) FROM venta GROUP BY id_articulo;

# Ejercicios
# Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre empiece con a
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE'a%';
# Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre termina con on
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE '%on';
# Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre incluye la cadena on
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE '%on%';
# Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyos nombres tienen tres letras e inician con T y finalizan con m
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE 'T_m';
# Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre no inicia con B
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstNAME NOT LIKE 'B%';
# Dentro de la tabla products, obten el código de producto y nombre de los productos cuyo código incluye la cadena _20
SELECT productCode, productName FROM products WHERE productCode LIKE '%_20%';
# Dentro de la tabla orderdetails, obten el total de cada orden
SELECT orderNumber, sum(quantityOrdered*priceEach) AS total FROM orderdetails GROUP BY orderNumber;
# Dentro de la tabla orders obten el número de órdenes por año.
SELECT EXTRACT(YEAR FROM orderDate) AS yearDate, count(*) AS total FROM orders GROUP BY EXTRACT(YEAR FROM orderDate); 
# Obten el apellido y nombre de los empleados cuya oficina está ubicada en USA
SELECT lastName, firstName, officeCode FROM employees WHERE officeCode IN (SELECT officeCode FROM offices WHERE country = 'USA');
# Obten el número de cliente, número de cheque y cantidad del cliente que ha realizado el pago más alto
SELECT customerNumber, checkNumber, amount FROM payments WHERE amount = (SELECT MAX(amount) maxAmount FROM payments);
# Obten el número de cliente, número de cheque y cantidad de aquellos clientes cuyo pago es más alto que el promedio
SELECT customerNumber, checkNumber, amount FROM payments WHERE amount > (SELECT AVG(amount) maxAmount FROM payments);
# Obten el nombre de aquellos clientes que no han hecho ninguna orden.
SELECT customerNumber, customerName FROM customers WHERE customerNumber NOT IN (SELECT customerNumber FROM orders);
# Obten el máximo, mínimo y promedio del número de productos en las órdenes de venta
SELECT MAX(quantityOrdered) AS maxOrdered, MIN(quantityOrdered) AS minOrdered, AVG(quantityordered) AS averageOrdered FROM orderdetails;
# Dentro de la tabla orders, obten el número de órdenes que hay por cada estado
SELECT status, COUNT(*) FROM orders GROUP BY status ;








