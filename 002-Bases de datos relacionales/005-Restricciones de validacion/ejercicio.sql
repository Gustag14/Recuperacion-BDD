-- 005 - Restricciones de validación (CHECK, NOT NULL, UNIQUE, DEFAULT)

CREATE TABLE socios (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad   INT NOT NULL CHECK (edad >= 18 AND edad <= 120),
    email  VARCHAR(150) UNIQUE,
    activo TINYINT(1) DEFAULT 1
);

-- Inserción válida
INSERT INTO socios (nombre, edad, email) VALUES ('Laura Martínez', 25, 'laura@mail.com');

-- Inserción que debería fallar por CHECK (edad < 18)
-- INSERT INTO socios (nombre, edad) VALUES ('Niño', 10);

SELECT * FROM socios;
