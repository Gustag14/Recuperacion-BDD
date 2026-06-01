-- 007 - El valor NULL

CREATE TABLE contactos (
    id       INT AUTO_INCREMENT PRIMARY KEY,
    nombre   VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),        -- puede ser NULL
    notas    TEXT                -- puede ser NULL
);

INSERT INTO contactos (nombre, telefono) VALUES ('Ana', '600123456');
INSERT INTO contactos (nombre)           VALUES ('Berto');          -- telefono es NULL

-- Comparación correcta con NULL (usar IS NULL / IS NOT NULL)
SELECT * FROM contactos WHERE telefono IS NULL;
SELECT * FROM contactos WHERE telefono IS NOT NULL;

-- NULL en operaciones aritméticas (resultado es NULL)
SELECT nombre, telefono + 0 AS resultado FROM contactos;

-- COALESCE: devuelve el primer valor no NULL
SELECT nombre, COALESCE(telefono, 'Sin teléfono') AS contacto FROM contactos;
