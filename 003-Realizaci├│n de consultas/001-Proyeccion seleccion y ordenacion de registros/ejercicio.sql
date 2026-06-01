-- 001 - Proyección, selección y ordenación

CREATE TABLE empleados (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    nombre     VARCHAR(100),
    apellidos  VARCHAR(150),
    salario    DECIMAL(9,2),
    ciudad     VARCHAR(80),
    activo     TINYINT(1) DEFAULT 1
);

INSERT INTO empleados (nombre, apellidos, salario, ciudad) VALUES
    ('Ana',    'García López',   2500.00, 'Madrid'),
    ('Carlos', 'Pérez Ruiz',     1900.00, 'Valencia'),
    ('Marta',  'Fernández Gil',  3100.00, 'Madrid'),
    ('David',  'Sánchez Torres', 1750.00, 'Barcelona'),
    ('Elena',  'Gómez Díaz',     2200.00, 'Valencia');

-- Proyección: seleccionar solo algunas columnas
SELECT nombre, apellidos FROM empleados;

-- Selección: filtrar filas con WHERE
SELECT * FROM empleados WHERE ciudad = 'Madrid';

-- Ordenación: ASC por defecto, DESC para invertir
SELECT nombre, salario FROM empleados ORDER BY salario DESC;

-- Limitar resultados
SELECT nombre, salario FROM empleados ORDER BY salario DESC LIMIT 3;

-- DISTINCT: sin duplicados
SELECT DISTINCT ciudad FROM empleados;
