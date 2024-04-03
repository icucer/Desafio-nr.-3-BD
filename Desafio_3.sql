-- Creacion y uso de Base de Datos
CREATE DATABASE Movies;
USE Movies;

-- Creacion de tablas
CREATE TABLE movies(
    id INT AUTO_INCREMENT PRIMARY KEY,
    movieName VARCHAR(255),
    premieredYear INT,
    movieDirector VARCHAR(255)
);

CREATE TABLE actors(
    movieID INT,
    actorName VARCHAR(255),
    FOREIGN KEY (movieID) REFERENCES movies(id)
);

/* Este codigo sirve para importar datos desde un archivo externo a la Base de Datos
-- 1) Indicamos la ruta del archivo a importar
LOAD DATA INFILE
    'C:\Users\Ion\Desktop\SENCE\BD\Desafio nr. 3\Apoyo Desafío evaluado - Definición de tablas\Apoyo Desafi╠üo - Top 100\peliculas.csv'
-- 2) Indicamos en qué tabla insertaremos los datos
INTO TABLE movies
-- 3) Indicamos cómo están separados los valores uno del otro. En nuestro caso, es una coma.
FIELDS TERMINATED BY ','
-- 4) Indicamos cómo termina la línea; en este caso, es mediante un salto de línea, representado de la siguiente manera: '\n'.
LINES TERMINATED BY '\n'
-- 5) Y por último, indicamos que ignore la primera línea, ya que representa los nombres de las columnas.
IGNORE 1 ROWS;
*/

-- Así como el siguiente código no funciona por un tema de seguridad de MySQL,
-- haremos la importación de los datos mediante la interfaz gráfica.
-- La descripción del proceso estará en un archivo PDF adjunto al presente trabajo.

-- Obtener el ID de la película “Titanic”
SELECT id FROM movies WHERE movieName = 'Titanic';

-- Listar a todos los actores que aparecen en la película "Titanic"
-- se realizara mediante un JOIN para relacionar las claves primarias de la tabla movies
-- con las claves foraneas de las tabla actors.
SELECT actors.actorName FROM actors
    JOIN movies ON actors.movieID = movies.id WHERE movies.id = 2;

-- Consultar en cuántas películas del top 100 participa Harrison Ford
SELECT COUNT(id) FROM movies
    JOIN actors ON movies.id = actors.movieID WHERE actors.actorName = 'Harrison Ford';

-- Indicar las películas estrenadas entre los años 1990 y 1999, ordenadas por título
-- en orden ascendente
SELECT movieName FROM movies
    WHERE premieredYear > 1900 AND premieredYear < 1999
    ORDER BY movieName;

-- Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser
-- nombrado para la consulta como “longitud_titulo” equivalente en ingles "length_name"
SELECT movieName, LENGTH(movieName) AS length_name FROM movies;

-- Consultar cual es la longitud más grande entre todos los títulos de las películas.
-- Se mostrará el título de la película y su longitud.
SELECT movieName, LENGTH(movieName) AS length_name FROM movies
    ORDER BY length_name DESC LIMIT 1;