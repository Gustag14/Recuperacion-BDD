-- 002 - Integridad referencial

CREATE TABLE fabricantes (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE dispositivos (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    modelo        VARCHAR(150) NOT NULL,
    id_fabricante INT NOT NULL,
    FOREIGN KEY (id_fabricante) REFERENCES fabricantes(id)
        ON DELETE RESTRICT   -- no se puede borrar el fabricante si tiene dispositivos
        ON UPDATE CASCADE    -- si cambia el id del fabricante, se actualiza aquí también
);

INSERT INTO fabricantes (nombre) VALUES ('Apple'), ('Samsung'), ('Xiaomi');
INSERT INTO dispositivos (modelo, id_fabricante) VALUES
    ('iPhone 15', 1), ('Galaxy S24', 2), ('Redmi Note 13', 3);

-- Intento de borrar fabricante con dispositivos → error
-- DELETE FROM fabricantes WHERE id = 1;

-- Consulta que verifica integridad
SELECT d.modelo, f.nombre AS fabricante
FROM dispositivos d JOIN fabricantes f ON d.id_fabricante = f.id;
