-- 001 - INSERT, UPDATE, DELETE

CREATE TABLE productos (
    id       INT AUTO_INCREMENT PRIMARY KEY,
    nombre   VARCHAR(150) NOT NULL,
    precio   DECIMAL(8,2) NOT NULL,
    stock    INT DEFAULT 0
);

-- INSERT simple
INSERT INTO productos (nombre, precio, stock) VALUES ('Portátil', 899.00, 10);

-- INSERT múltiple
INSERT INTO productos (nombre, precio, stock) VALUES
    ('Monitor 24"', 249.00, 5),
    ('Teclado',      39.99, 20),
    ('Ratón óptico', 19.99, 30);

-- INSERT ... SELECT (copiar datos de otra tabla)
-- INSERT INTO productos_backup SELECT * FROM productos;

-- UPDATE: modificar registros
UPDATE productos SET precio = 849.00 WHERE nombre = 'Portátil';

-- UPDATE múltiples columnas
UPDATE productos SET precio = precio * 0.9, stock = stock + 5 WHERE stock < 10;

-- DELETE con condición
DELETE FROM productos WHERE stock = 0;

-- DELETE sin condición (borra TODAS las filas, conserva la tabla)
-- DELETE FROM productos;

SELECT * FROM productos;
