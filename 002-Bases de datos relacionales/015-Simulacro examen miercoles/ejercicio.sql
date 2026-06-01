-- 015 - Simulacro examen (miércoles)
-- Base de datos de una clínica veterinaria

CREATE DATABASE IF NOT EXISTS veterinaria;
USE veterinaria;

CREATE TABLE propietarios (
    id      INT AUTO_INCREMENT PRIMARY KEY,
    nombre  VARCHAR(150) NOT NULL,
    telefono VARCHAR(15)
);

CREATE TABLE animales (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    nombre       VARCHAR(80) NOT NULL,
    especie      ENUM('perro','gato','ave','reptil','otro') NOT NULL,
    fecha_nac    DATE,
    id_propietario INT,
    FOREIGN KEY (id_propietario) REFERENCES propietarios(id)
);

CREATE TABLE visitas (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    id_animal  INT NOT NULL,
    fecha      DATE NOT NULL,
    motivo     TEXT,
    coste      DECIMAL(7,2),
    FOREIGN KEY (id_animal) REFERENCES animales(id)
);

INSERT INTO propietarios (nombre, telefono) VALUES ('Sofía Gómez', '612345678');
INSERT INTO animales (nombre, especie, fecha_nac, id_propietario)
    VALUES ('Rocky', 'perro', '2020-03-10', 1);
INSERT INTO visitas (id_animal, fecha, motivo, coste)
    VALUES (1, CURDATE(), 'Revisión anual', 45.00);

SELECT a.nombre AS animal, p.nombre AS dueño, v.fecha, v.motivo, v.coste
FROM visitas v
JOIN animales a    ON v.id_animal = a.id
JOIN propietarios p ON a.id_propietario = p.id;
