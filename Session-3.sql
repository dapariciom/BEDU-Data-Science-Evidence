USE tienda;
USE classicmodels;
DESCRIBE venta;

# RETO 1
# ¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000? 
SELECT * FROM empleado WHERE id_puesto IN (SELECT id_puesto FROM puesto WHERE salario < 10000);
# ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT id_empleado, MIN(total_ventas), MAX(total_ventas) FROM
(SELECT clave, id_empleado, count(*) AS total_ventas FROM venta GROUP BY clave, id_empleado) AS sq
GROUP BY id_empleado;
# ¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
SELECT * FROM venta WHERE id_articulo IN (SELECT id_articulo FROM articulo WHERE precio > 5000) ORDER BY id_articulo;

# RETO 2
# ¿Cuál es el nombre de los empleados que realizaron cada venta?
SELECT * FROM venta AS v LEFT JOIN empleado AS e ON v.id_empleado = e.id_empleado;
# ¿Cuál es el nombre de los artículos que se han vendido?
SELECT * FROM venta LEFT JOIN articulo USING (id_articulo);
# ¿Cuál es el total de cada venta?
SELECT clave, round(SUM(precio)) AS total FROM venta LEFT JOIN articulo USING (id_articulo) GROUP BY clave;

# RETO 3
# Obtener el puesto de un empleado.
CREATE VIEW puestos064 AS (SELECT e.nombre AS empleado_nombre, p.nombre AS puesto_nombre FROM empleado AS e LEFT JOIN puesto AS p ON e.id_puesto = p.id_puesto);
SELECT * FROM puestos064;
# Saber qué artículos ha vendido cada empleado
CREATE VIEW empleado_articulo064 AS (SELECT CONCAT(e.nombre, ' ', e.apellido_paterno) AS nombre, a.nombre articulo FROM venta AS v JOIN empleado AS e USING(id_empleado) JOIN articulo AS a USING(id_articulo));
SELECT * FROM empleado_articulo064;
# Saber qué puesto ha tenido más ventas.
CREATE VIEW puesto_ventas064 AS (SELECT p.nombre, COUNT(*) AS total_ventas FROM venta AS v JOIN empleado AS e USING(id_empleado) JOIN puesto AS p USING(id_puesto) GROUP BY p.nombre);
SELECT * FROM puesto_ventas064 ORDER BY total_ventas DESC LIMIT 1;

# EJERCICIOS
# Obten el código de producto, nombre de producto y descripción de todos los productos
SELECT * FROM products;
# Obten el número de orden, estado y costo total de cada orden.
SELECT orderNumber, status, SUM(quantityOrdered*priceEach) As totalProduct FROM orderdetails RIGHT JOIN orders USING (orderNumber) GROUP BY orderNumber;
# Obten el número de orden, fecha de orden, línea de orden, nombre del producto, cantidad ordenada y precio de cada pieza que muestre los detalles de cada orden.
SELECT orderNumber, orderDate, orderLineNumber, productName, quantityOrdered, priceEach FROM orders RIGHT JOIN orderdetails USING (orderNumber) RIGHT JOIN products USING (productCode) ;
# Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp) y precio de cada pieza.
SELECT orderNumber, productName, MSRP, priceEach FROM orders RIGHT JOIN orderdetails USING (orderNumber) RIGHT JOIN products USING (productCode);
# Obtén el número de cliente, nombre de cliente, número de orden y estado de cada cliente.




