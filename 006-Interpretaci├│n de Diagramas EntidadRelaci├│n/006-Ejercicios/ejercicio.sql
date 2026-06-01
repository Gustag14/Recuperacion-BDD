-- 006 - Ejercicios de modelado y paso a tablas

-- EJERCICIO 1: Centro educativo
-- Entidades: Alumno, Módulo, Profesor
-- Alumno se matricula en Módulo (N:M)
-- Módulo es impartido por Profesor (N:1)

CREATE TABLE profesores (
    id      INT AUTO_INCREMENT PRIMARY KEY,
    nombre  VARCHAR(150) NOT NULL,
    especialidad VARCHAR(100)
);

CREATE TABLE modulos (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    nombre     VARCHAR(150) NOT NULL,
    horas      INT,
    id_profesor INT,
    FOREIGN KEY (id_profesor) REFERENCES profesores(id)
);

CREATE TABLE alumnos (
    id      INT AUTO_INCREMENT PRIMARY KEY,
    nombre  VARCHAR(150) NOT NULL,
    curso   VARCHAR(20)
);

CREATE TABLE matriculas (
    id_alumno  INT NOT NULL,
    id_modulo  INT NOT NULL,
    nota_final DECIMAL(4,2),
    PRIMARY KEY (id_alumno, id_modulo),
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id),
    FOREIGN KEY (id_modulo) REFERENCES modulos(id)
);

-- Datos de prueba
INSERT INTO profesores (nombre, especialidad) VALUES ('Profe SQL', 'Bases de Datos');
INSERT INTO modulos (nombre, horas, id_profesor) VALUES ('Bases de Datos', 96, 1);
INSERT INTO alumnos (nombre, curso) VALUES ('Alumno 1', 'DAM2'), ('Alumno 2', 'DAW2');
INSERT INTO matriculas VALUES (1, 1, 8.5), (2, 1, 7.0);

SELECT a.nombre, m.nombre AS modulo, mat.nota_final
FROM matriculas mat
JOIN alumnos a ON mat.id_alumno = a.id
JOIN modulos m ON mat.id_modulo = m.id;
