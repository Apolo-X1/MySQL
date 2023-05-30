-- crear la base de datos
CREATE DATABASE IF NOT EXISTS hola_mundo;

-- mostrar las bases de datos creadas
SHOW DATABASES;


-- tipos de datos:
-- int = numeros enteros
-- float = numeros con decimal
-- varchar = cadenas de texto dentro de ""

-- siempre debemos indicar la base de datos que se utilizara
USE hola_mundo;

-- crear una nueva tabla
CREATE TABLE IF NOT EXISTS animales(
	id INT,
    tipo VARCHAR(250), -- 250 es la longitud
    estado VARCHAR (250),
    PRIMARY KEY(id) -- llave primaria
);

-- insertar o agregar datos a la/las tablas
INSERT INTO animales(tipo, estado) VALUES ("chanchito", "feliz");
INSERT INTO animales(tipo, estado) VALUES ("dragon", "neutro");
INSERT INTO animales(tipo, estado) VALUES ("exo", "enojado");

-- modificar una tabla (en este caso modificaremos el id para que sea auto-incremental)
ALTER TABLE animales MODIFY COLUMN id INT AUTO_INCREMENT;






-- seleccionar y mostrar tablas o columnas

-- mostrar toda la tabla animales
SELECT * FROM animales;

-- mostrar una registro que cumpla cierto criterio
SELECT * FROM animales WHERE id = 1; -- en este caso es que el id sea 1

-- otra manera de mostrar un registro agregando una condicion 
SELECT * FROM animales WHERE tipo = "dragon" AND estado = "neutro";





-- actualizar los registros que ya se encuentran dentro de nuestra base de datos en alguna tabla
UPDATE animales SET estado = "mamadisimo" WHERE id = 1; -- solamente se actualiza por id





-- eliminar registros de la base de datos de alguna tabla
DELETE FROM animales WHERE id = 1; -- solamente se elimina por id

-- eliminar una db
DROP DATABASE nombre_de_la_db;