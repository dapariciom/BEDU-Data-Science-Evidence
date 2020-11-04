USE tienda;
SHOW TABLES;
DESCRIBE puesto;
DESCRIBE venta;

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
