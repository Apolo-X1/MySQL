CREATE DATABASE IF NOT EXISTS fake_page;
USE fake_page;

CREATE TABLE IF NOT EXISTS usuarios(
	id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100), 
    edad INT NOT NULL,
    email VARCHAR (100),
    PRIMARY KEY(id)
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

