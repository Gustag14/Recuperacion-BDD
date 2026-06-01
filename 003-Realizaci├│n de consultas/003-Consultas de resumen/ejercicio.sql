-- 003 - Consultas de resumen (funciones de agregación)

CREATE TABLE ventas (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    producto   VARCHAR(100),
    cantidad   INT,
    precio     DECIMAL(8,2),
    fecha      DATE
);

INSERT INTO ventas (producto, cantidad, precio, fecha) VALUES
    ('Monitor',   2, 250.00, '2025-01-10'),
    ('Teclado',   5,  45.00, '2025-01-12'),
    ('Ratón',     8,  22.00, '2025-01-12'),
    ('Monitor',   1, 250.00, '2025-02-05'),
    ('Auriculares',3, 79.00, '2025-02-20');

-- COUNT: número de registros
SELECT COUNT(*) AS total_ventas FROM ventas;

-- SUM: suma de valores
SELECT SUM(cantidad * precio) AS ingresos_totales FROM ventas;

-- AVG: media
SELECT AVG(precio) AS precio_medio FROM ventas;

-- MAX / MIN
SELECT MAX(precio) AS mas_caro, MIN(precio) AS mas_barato FROM ventas;

-- Combinar varias funciones
SELECT
    COUNT(*)                    AS num_transacciones,
    SUM(cantidad)               AS unidades_vendidas,
    SUM(cantidad * precio)      AS facturacion,
    ROUND(AVG(precio), 2)       AS precio_medio
FROM ventas;
