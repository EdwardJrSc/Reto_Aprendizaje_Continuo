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

select nombre nf from fabricante f order by nf desc;

--- 2) Lista los nombres de los productos ordenados de manera Ascendente. ---

select nombre np from producto p order by np asc;

--- 3) Lista el codigo de los fabricantes que tienen productos en la tabla producto,  mostrando los codigos sin repeticion.  ---

select distinct codigo_fabricante from producto;

--- 4) Traer los 3 productos que tienen menor precio. ---

select nombre nm, precio p from producto tp order by p asc limit 3;

--- 5) Traer los cinco productos de mayor precio. ---

select nombre nm, precio p from producto tp order by p desc limit 5;

--- 6) Realizar la insercion de tres nuevos productos. ---

INSERT INTO producto VALUES(12, 'Tarjeta Grafica NVIDIA GeForce GTX 9999x Pro', 1286.99, 7);
INSERT INTO producto VALUES(13, 'Disco duro SSD 1TB', 569, 9);
INSERT INTO producto VALUES(14, 'Memoria RAM 62GB 4200 Ghz', 52, 1);

--- 7) Consultar los productos que sea impresora HP. ---

select nombre nm from producto p where nombre like '%Impresora hp%';

--- 8) Eliminar uno de los nuevos productos creados.  ---

delete from producto where codigo = '12';
select codigo  from producto p order by codigo asc;

--- 9) Actualizar el precio de uno de los productos creados. ---

update producto p set precio = '10000' where codigo = '11';
select codigo, precio from producto p where codigo = '11';

--- 10)	Traer los productos que eston dentro del rango de precios 120 y 500. ---

select nombre, precio from producto where precio between '120' and '500';

--- 11) Consultar el nombre de cada fabricante con los productos asociados a ellos incluso mostrando los fabricantes que no tienen algon producto asignado. ---
 
SELECT 
    F.nombre AS 'Fabricante',
    P.nombre AS 'Producto'
FROM Fabricante f
LEFT JOIN Producto P
ON F.codigo = P.codigo_fabricante;

--- 12) Consultar cada producto con el nombre de cada fabricante. ---

select p.nombre, p.codigo_fabricante, f.nombre from producto as p inner join fabricante f on p.codigo_fabricante  = f.codigo; 

--- 13) Traer los productos asociados cuyo fabricante es 'Crucia' con su respectivo nombre. ---

select * from producto, fabricante where producto.codigo_fabricante = '6' and fabricante.codigo = '6'; 
