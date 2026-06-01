-- 016 - Examen final
-- Base de datos de una academia de idiomas

CREATE DATABASE IF NOT EXISTS academia;
USE academia;

CREATE TABLE idiomas (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE cursos (
    id        INT AUTO_INCREMENT PRIMARY KEY,
    nivel     VARCHAR(10) NOT NULL,
    id_idioma INT NOT NULL,
    precio    DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (id_idioma) REFERENCES idiomas(id)
);

CREATE TABLE alumnos (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    email  VARCHAR(150) UNIQUE NOT NULL
);

CREATE TABLE matriculas (
    id_alumno INT NOT NULL,
    id_curso  INT NOT NULL,
    fecha     DATE NOT NULL DEFAULT (CURDATE()),
    PRIMARY KEY (id_alumno, id_curso),
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id),
    FOREIGN KEY (id_curso)  REFERENCES cursos(id)
);

INSERT INTO idiomas (nombre) VALUES ('Inglés'), ('Francés'), ('Alemán');
INSERT INTO cursos (nivel, id_idioma, precio) VALUES ('A1', 1, 150), ('B2', 1, 200), ('A2', 2, 160);
INSERT INTO alumnos (nombre, email) VALUES ('Javier Torres', 'javier@mail.com');
INSERT INTO matriculas (id_alumno, id_curso, fecha) VALUES (1, 1, CURDATE());

-- Consulta resumen
SELECT a.nombre AS alumno, i.nombre AS idioma, c.nivel, m.fecha
FROM matriculas m
JOIN alumnos a  ON m.id_alumno = a.id
JOIN cursos c   ON m.id_curso  = c.id
JOIN idiomas i  ON c.id_idioma = i.id;
