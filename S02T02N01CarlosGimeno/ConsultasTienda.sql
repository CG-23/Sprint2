SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, concat(precio,'€'), concat(precio,'$') FROM producto;
SELECT nombre as nom_de_producto, concat(precio,'€') as euros, concat(precio,'$') as dòlars FROM producto;
SELECT UCASE(nombre), precio FROM producto;
SELECT LCASE(nombre), precio FROM producto;
SELECT nombre, UCASE(substring(nombre,1,2)) FROM fabricante;
SELECT nombre, ROUND(precio) FROM producto;
SELECT truncate (precio,0) from producto;
SELECT CODIGO_FABRICANTE FROM PRODUCTO;
SELECT distinct(codigo_fabricante) FROM PRODUCTO;
SELECT nombre from fabricante order by nombre asc;
SELECT nombre from fabricante order by nombre desc;
SELECT nombre from producto order by nombre asc, precio desc;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3,2;
SELECT NOMBRE, PRECIO FROM PRODUCTO order by PRECIO ASC LIMIT 1; 
SELECT NOMBRE, PRECIO FROM PRODUCTO order by PRECIO DESC LIMIT 1 ; 
SELECT NOMBRE FROM PRODUCTO WHERE CODIGO_FABRICANTE =2;
SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE FROM PRODUCTO LEFT JOIN FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO;
SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE FROM PRODUCTO LEFT JOIN FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO ORDER BY FABRICANTE.NOMBRE;
SELECT PRODUCTO.CODIGO, PRODUCTO.NOMBRE, PRODUCTO.CODIGO_FABRICANTE, FABRICANTE.NOMBRE FROM PRODUCTO LEFT JOIN FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO;
SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE FROM PRODUCTO LEFT JOIN FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO order by PRECIO ASC LIMIT 1;
SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE FROM PRODUCTO LEFT JOIN FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO order by PRECIO DESC LIMIT 1;
SELECT PRODUCTO.NOMBRE FROM PRODUCTO LEFT JOIN FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO WHERE FABRICANTE.NOMBRE = 'Lenovo';
SELECT PRODUCTO.NOMBRE FROM PRODUCTO LEFT JOIN FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO WHERE FABRICANTE.NOMBRE = 'Crucial' AND PRODUCTO.PRECIO > 200;
SELECT PRODUCTO.NOMBRE FROM PRODUCTO LEFT JOIN FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO WHERE FABRICANTE.NOMBRE ='Asus' OR FABRICANTE.NOMBRE ='Hewlett-Packard' OR FABRICANTE.NOMBRE ='Seagate';
SELECT PRODUCTO.NOMBRE FROM PRODUCTO LEFT JOIN FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO WHERE FABRICANTE.NOMBRE IN ('Asus', 'Hewlett-Packard', 'Seagate');
SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO FROM PRODUCTO LEFT JOIN FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO WHERE FABRICANTE.NOMBRE LIKE '%E';
SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO FROM PRODUCTO LEFT JOIN FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO WHERE FABRICANTE.NOMBRE LIKE '%W%';
SELECT PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE FROM PRODUCTO LEFT JOIN FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO WHERE PRODUCTO.PRECIO >= 180 ORDER BY PRODUCTO.PRECIO DESC, PRODUCTO.NOMBRE ASC;
SELECT DISTINCT FABRICANTE.CODIGO, FABRICANTE.NOMBRE FROM PRODUCTO INNER JOIN FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO;
SELECT FABRICANTE.NOMBRE, PRODUCTO.NOMBRE FROM PRODUCTO RIGHT JOIN FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO;
SELECT FABRICANTE.NOMBRE FROM PRODUCTO RIGHT JOIN FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO WHERE PRODUCTO.NOMBRE IS NULL ;
SELECT PRODUCTO.NOMBRE FROM PRODUCTO, FABRICANTE WHERE PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO AND FABRICANTE.NOMBRE = 'Lenovo';
SELECT PRODUCTO.CODIGO, PRODUCTO.NOMBRE, PRODUCTO.PRECIO, FABRICANTE.NOMBRE AS FABRICANTE FROM PRODUCTO, FABRICANTE WHERE PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO AND PRODUCTO.PRECIO = (SELECT MAX(PRODUCTO.PRECIO) FROM PRODUCTO, FABRICANTE WHERE PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO AND FABRICANTE.NOMBRE = 'LENOVO');
SELECT PRODUCTO.NOMBRE FROM PRODUCTO, FABRICANTE WHERE PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO AND FABRICANTE.NOMBRE = 'LENOVO' AND PRODUCTO.PRECIO =  (SELECT MAX(PRODUCTO.PRECIO) FROM PRODUCTO, FABRICANTE WHERE PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO AND FABRICANTE.NOMBRE = 'Lenovo');
SELECT PRODUCTO.NOMBRE FROM PRODUCTO, FABRICANTE WHERE PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO AND FABRICANTE.NOMBRE = 'Hewlett-Packard' AND PRODUCTO.PRECIO =  (SELECT MIN(PRODUCTO.PRECIO) FROM PRODUCTO, FABRICANTE WHERE PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO AND FABRICANTE.NOMBRE = 'Hewlett-Packard');
SELECT PRODUCTO.NOMBRE FROM PRODUCTO, FABRICANTE WHERE PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO AND NOT FABRICANTE.NOMBRE = 'LENOVO' AND PRODUCTO.PRECIO >= (SELECT MAX(PRODUCTO.PRECIO) FROM PRODUCTO, FABRICANTE WHERE PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO AND FABRICANTE.NOMBRE = 'LENOVO');
SELECT PRODUCTO.NOMBRE FROM PRODUCTO, FABRICANTE WHERE PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO AND FABRICANTE.NOMBRE = 'ASUS' AND PRODUCTO.PRECIO > (SELECT AVG(PRODUCTO.PRECIO) FROM PRODUCTO, FABRICANTE WHERE PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO AND FABRICANTE.NOMBRE = 'ASUS');