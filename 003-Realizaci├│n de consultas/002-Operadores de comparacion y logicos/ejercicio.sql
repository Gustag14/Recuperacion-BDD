-- 002 - Operadores de comparación y lógicos

-- Reutilizamos la tabla empleados del ejercicio anterior

-- Operadores de comparación: =, !=, <>, <, >, <=, >=
SELECT * FROM empleados WHERE salario > 2000;
SELECT * FROM empleados WHERE ciudad != 'Madrid';

-- BETWEEN (inclusive)
SELECT * FROM empleados WHERE salario BETWEEN 1800 AND 2500;

-- IN / NOT IN
SELECT * FROM empleados WHERE ciudad IN ('Madrid', 'Barcelona');

-- LIKE (búsqueda de patrones)
SELECT * FROM empleados WHERE nombre LIKE 'A%';    -- empieza por A
SELECT * FROM empleados WHERE apellidos LIKE '%ez'; -- termina en ez

-- Operadores lógicos: AND, OR, NOT
SELECT * FROM empleados WHERE ciudad = 'Madrid' AND salario > 2000;
SELECT * FROM empleados WHERE ciudad = 'Valencia' OR salario > 3000;
SELECT * FROM empleados WHERE NOT ciudad = 'Barcelona';

-- IS NULL / IS NOT NULL
SELECT * FROM empleados WHERE ciudad IS NOT NULL;
