-- 013 - Ejercicio final de unidad: base de datos de una biblioteca

CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

CREATE TABLE autores (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    pais   VARCHAR(80)
);

CREATE TABLE libros (
    id        INT AUTO_INCREMENT PRIMARY KEY,
    titulo    VARCHAR(250) NOT NULL,
    anio      YEAR,
    id_autor  INT NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES autores(id) ON DELETE RESTRICT
);

CREATE TABLE socios (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    email  VARCHAR(150) UNIQUE
);

CREATE TABLE prestamos (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    id_socio    INT NOT NULL,
    id_libro    INT NOT NULL,
    fecha_ini   DATE NOT NULL,
    fecha_fin   DATE,
    FOREIGN KEY (id_socio) REFERENCES socios(id),
    FOREIGN KEY (id_libro) REFERENCES libros(id)
);

-- Datos de ejemplo
INSERT INTO autores (nombre, pais) VALUES ('Miguel de Cervantes', 'España'), ('Gabriel García Márquez', 'Colombia');
INSERT INTO libros (titulo, anio, id_autor) VALUES ('El Quijote', 1605, 1), ('Cien años de soledad', 1967, 2);
INSERT INTO socios (nombre, email) VALUES ('Ana Flores', 'ana@bib.es');
INSERT INTO prestamos (id_socio, id_libro, fecha_ini) VALUES (1, 1, CURDATE());

SELECT l.titulo, a.nombre AS autor, s.nombre AS socio, p.fecha_ini
FROM prestamos p
JOIN libros l ON p.id_libro = l.id
JOIN autores a ON l.id_autor = a.id
JOIN socios s ON p.id_socio = s.id;
