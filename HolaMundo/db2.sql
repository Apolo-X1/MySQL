CREATE DATABASE IF NOT EXISTS fakePage;
USE fakePage;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100),
    edad INT NOT NULL,
    email VARCHAR(100),
    PRIMARY KEY (id)
);

INSERT INTO usuarios (nombre, edad, email) VALUES ("David", 18, "david@gmail.com");
INSERT INTO usuarios (nombre, edad, email) VALUES ("Jhon", 20, "jhon@gmail.com");
INSERT INTO usuarios (nombre, edad, email) VALUES ("Apolo", 19, "apolo@gmail.com");
INSERT INTO usuarios (nombre, edad, email) VALUES ("Latino", 28, "latino@gmail.com");


SELECT * FROM usuarios LIMIT 2; -- limite de registros que nos mostrara (osea de 1 al 2)
SELECT * FROM usuarios WHERE edad > 20; -- mostrara solamente los registros con edad mayor a 20
SELECT * FROM usuarios WHERE edad BETWEEN 20 AND 30; -- mostrara solamente los registros cuya edad se encuentre entre 20 y 30

SELECT * FROM usuarios WHERE email LIKE "%gmail.com"; -- el "%" indiica que lo que este antes de ello no nos importa
SELECT * FROM usuarios WHERE email LIKE "apolo%"; -- nos traera los correos que empiecen por apolo y no importa si despues de apolo hay otro texto
SELECT * FROM usuarios WHERE email LIKE "%apolo%"; -- busca en todos los correos y si hay uno que diga apolo en algun lugar sea al principio o al final, nos lo traera


SELECT * FROM usuarios ORDER BY edad ASC; -- ordenara todos los registros de edad en orden ascendente, de menor a mayor
SELECT * FROM usuarios ORDER BY edad DESC; -- en orden descendente


SELECT MAX(edad) as mayor FROM usuarios; -- trae la edad mas alta
SELECT MIN(edad) as menor FROM usuarios; -- trae la edad mas baja





-- hemos trabajado con "SELECT *" pero tambien podemos trabajar solamente con las columnas que sean de interes
SELECT id, nombre FROM usuarios;

--
--
--
--
--
--
--
--
--
--
--

-- union de tablas "join"
CREATE TABLE IF NOT EXISTS producto (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100), 
    creado_por INT NOT NULL, -- este va a ser el id del usuario que creo el producto
    marca VARCHAR (100),
    PRIMARY KEY(id),
    FOREIGN KEY (creado_por) REFERENCES usuarios(id) -- aqui se indica la llave foranea y luego se le indica de que tabla va a traer el id
);


-- renombrar una tabla
RENAME TABLE producto TO productos;

-- anteriormente insertamos datos 1 a 1, ahora insertaremos multiples datos
INSERT INTO productos (nombre, creado_por, marca)
VALUES
    ('Ipad', 1, 'Apple'),
    ('Nokia2', 2, 'Nokia'),
    ('Galaxi', 4, 'Samsung'),
    ('G6 play', 3, 'Motorola'),
    ('Tablet', 2, 'Lenovo');




-- cuando hacemos oun "lef join" indicamos 2 tablas, se traeran los datos de la primera tabla (dependiendo de la consulta) y luego verificara en la segunda tabla si hay alguna relacion (id/llave foranea) y de haberlos, entonces traera los registros, en caso de no ser asi no traera nada asi hayan registros.

-- paso 1
-- SELECT u.id u.email FROM usuarios u;

-- paso 2
-- SELECT u.id u.email FROM usuarios u LEFT JOIN productos;

-- paso 3
-- SELECT u.id u.email, p.name FROM usuarios u LEFT JOIN productos p;

-- paso final
SELECT u.id, u.email, p.nombre FROM usuarios u LEFT JOIN productos p ON u.id = p.creado_por;



-- "RIGHT JOIN"
-- es lo mismo que el "LEFT JOIN" pero al reves
SELECT u.id, u.email, p.nombre FROM usuarios u RIGHT JOIN productos p ON u.id = p.creado_por;


-- "INNER JOIN"
-- este lo que hace es traernos todos los registros de las 2 tablas pero solo nos mostrara los que puedan estar asociados (que se encuentren en las 2 tablas)
SELECT u.id, u.email, p.nombre FROM usuarios u INNER JOIN productos p ON u.id = p.creado_por;


-- "CROSS JOIN"
-- este lo que hace es entregar el producto cartesiano entre ambas tablas.(producto cartesiano es juntar el registro numero 1 de la primera tabla con todos los registros de las otra tabla, luego el registro 2 de la primera tabla con todos los registros de la segunda y asi sucesivamente hasta que no queden registros de la primera.)
SELECT u.id, u.email, p.id, p.nombre FROM usuarios u CROSS JOIN productos p;









-- GROUP BY
-- lo que hara esto es tomar todos los registros en base a un pivote (en este ejemplo la marca) y lo agrupara en un nuevo registro. si tenemos 6 productos entonces creara un registro indicando cuantos productos son de cada marca.
SELECT COUNT(id), marca FROM productos GROUP BY marca;


-- AGREGANDO UN LEFT JOIN A GROUP BY
-- lo que hara esto es mostrar cuantos usuarios han creado cuantos productos
SELECT COUNT(*), u.nombre FROM productos p LEFT JOIN usuarios u ON u.id = p.creado_por GROUP BY p.creado_por;


-- aplicando una condicion al GROUP BY
-- en este caso nos devolvera solo aquellos donde su contador o registros sea mayor a 2
SELECT COUNT(*), u.nombre FROM productos p LEFT JOIN usuarios u ON u.id = p.creado_por GROUP BY p.creado_por HAVING COUNT(p.id) >= 2;
