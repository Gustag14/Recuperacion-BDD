-- 008 - Claves ajenas (FOREIGN KEY)

CREATE TABLE paises (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE ciudades (
    id       INT AUTO_INCREMENT PRIMARY KEY,
    nombre   VARCHAR(100) NOT NULL,
    id_pais  INT NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES paises(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO paises (nombre) VALUES ('España'), ('Francia');
INSERT INTO ciudades (nombre, id_pais) VALUES
    ('Madrid', 1), ('Barcelona', 1), ('París', 2);

-- JOIN entre tablas relacionadas
SELECT c.nombre AS ciudad, p.nombre AS pais
FROM ciudades c
JOIN paises p ON c.id_pais = p.id;
