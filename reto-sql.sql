CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

--- 1) Lista los nombres de los fabricantes ordenados de forma descendente. ---

SELECT nombre nf FROM fabricante f ORDER BY nf DESC;

--- 2) Lista los nombres de los productos ordenados de manera Ascendente. ---

SELECT nombre np FROM producto p ORDER BY np ASC;

--- 3) Lista el codigo de los fabricantes que tienen productos en la tabla producto,  mostrando los codigos sin repeticion.  ---

SELECT distinct codigo_fabricante FROM producto;

--- 4) Traer los 3 productos que tienen menor precio. ---

SELECT nombre nm, precio p FROM producto tp ORDER BY p ASC LIMIT 3;

--- 5) Traer los cinco productos de mayor precio. ---

SELECT nombre nm, precio p FROM producto tp ORDER BY p DESC LIMIT 5;

--- 6) Realizar la insercion de tres nuevos productos. ---

INSERT INTO producto VALUES(12, 'Tarjeta Grafica NVIDIA GeForce GTX 9999x Pro', 1286.99, 7);
INSERT INTO producto VALUES(13, 'Disco duro SSD 1TB', 569, 9);
INSERT INTO producto VALUES(14, 'Memoria RAM 62GB 4200 Ghz', 52, 1);

--- 7) Consultar los productos que sea impresora HP. ---

SELECT nombre nm FROM producto p WHERE nombre like '%Impresora hp%';

--- 8) Eliminar uno de los nuevos productos creados.  ---

DELETE FROM producto WHERE codigo = '12';
SELECT codigo  FROM producto p ORDER BY codigo ASC;

--- 9) Actualizar el precio de uno de los productos creados. ---

UPDATE producto p SET precio = '10000' WHERE codigo = '11';
SELECT codigo, precio FROM producto p WHERE codigo = '11';

--- 10)	Traer los productos que eston dentro del rango de precios 120 y 500. ---

SELECT nombre, precio FROM producto WHERE precio BETWEEN '120' AND '500';

--- 11) Consultar el nombre de cada fabricante con los productos asociados a ellos incluso mostrando los fabricantes que no tienen algun producto asignado. ---
 
SELECT 
    F.nombre AS 'Fabricante',
    P.nombre AS 'Producto'
FROM Fabricante F
LEFT JOIN Producto P
ON F.codigo = P.codigo_fabricante;

--- 12) Consultar cada producto con el nombre de cada fabricante. ---

SELECT
  p.nombre,
  p.codigo_fabricante,
  f.nombre
FROM producto AS p
INNER JOIN fabricante f
ON p.codigo_fabricante  = f.codigo; 

--- 13) Traer los productos asociados cuyo fabricante es 'Crucial' con su respectivo nombre. ---

SELECT * FROM producto, fabricante WHERE producto.codigo_fabricante = '6' AND fabricante.codigo = '6'; 
