-- 014 - Simulacro de examen
-- Crea la base de datos de un cine

CREATE DATABASE IF NOT EXISTS cine;
USE cine;

CREATE TABLE peliculas (
    id       INT AUTO_INCREMENT PRIMARY KEY,
    titulo   VARCHAR(200) NOT NULL,
    genero   VARCHAR(50),
    duracion INT COMMENT 'Minutos',
    CHECK (duracion > 0)
);

CREATE TABLE salas (
    id       INT AUTO_INCREMENT PRIMARY KEY,
    nombre   VARCHAR(50) NOT NULL,
    aforo    INT NOT NULL CHECK (aforo > 0)
);

CREATE TABLE sesiones (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    id_pelicula INT NOT NULL,
    id_sala     INT NOT NULL,
    hora_inicio DATETIME NOT NULL,
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id),
    FOREIGN KEY (id_sala)     REFERENCES salas(id)
);

INSERT INTO peliculas (titulo, genero, duracion) VALUES
    ('Interestelar', 'Ciencia ficción', 169),
    ('El Padrino',   'Drama',           175);

INSERT INTO salas (nombre, aforo) VALUES ('Sala 1', 120), ('Sala 2', 80);

INSERT INTO sesiones (id_pelicula, id_sala, hora_inicio) VALUES
    (1, 1, '2025-11-03 18:00:00'),
    (2, 2, '2025-11-03 20:30:00');

SELECT p.titulo, s.nombre AS sala, se.hora_inicio
FROM sesiones se
JOIN peliculas p ON se.id_pelicula = p.id
JOIN salas s     ON se.id_sala     = s.id;
