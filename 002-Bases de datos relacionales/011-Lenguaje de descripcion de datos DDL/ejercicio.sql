-- 011 - DDL (Data Definition Language)
-- CREATE, ALTER, DROP, TRUNCATE

-- Crear tabla
CREATE TABLE productos (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    stock  INT DEFAULT 0
);

-- Añadir columna
ALTER TABLE productos ADD COLUMN precio DECIMAL(8,2) NOT NULL DEFAULT 0;

-- Modificar columna
ALTER TABLE productos MODIFY COLUMN nombre VARCHAR(300) NOT NULL;

-- Renombrar columna
ALTER TABLE productos RENAME COLUMN stock TO cantidad;

-- Añadir índice
ALTER TABLE productos ADD INDEX idx_nombre (nombre);

-- Vaciar tabla (sin borrar su estructura)
TRUNCATE TABLE productos;

-- Eliminar tabla
-- DROP TABLE productos;

DESCRIBE productos;
