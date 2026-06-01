-- 009 - Optimización de consultas

-- Usar EXPLAIN para analizar una consulta
EXPLAIN SELECT * FROM empleados WHERE ciudad = 'Madrid';

-- Añadir índice para acelerar búsqueda por ciudad
CREATE INDEX idx_ciudad ON empleados(ciudad);

-- Volver a analizar con el índice
EXPLAIN SELECT * FROM empleados WHERE ciudad = 'Madrid';

-- Buenas prácticas:
-- 1. Seleccionar solo las columnas necesarias (no usar SELECT *)
SELECT nombre, salario FROM empleados WHERE ciudad = 'Madrid';

-- 2. Usar LIMIT cuando solo se necesitan N resultados
SELECT nombre FROM empleados ORDER BY salario DESC LIMIT 5;

-- 3. Evitar funciones en columnas indexadas (impiden usar el índice)
-- Malo:  WHERE YEAR(fecha) = 2025
-- Bueno: WHERE fecha BETWEEN '2025-01-01' AND '2025-12-31'

-- 4. Índices en columnas usadas en JOINs y WHERE frecuentes
CREATE INDEX idx_id_categoria ON articulos(id_categoria);
