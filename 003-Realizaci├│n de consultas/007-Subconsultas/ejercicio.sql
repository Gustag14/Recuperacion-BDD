-- 007 - Subconsultas

-- Empleados con salario superior a la media
SELECT nombre, salario
FROM empleados
WHERE salario > (SELECT AVG(salario) FROM empleados);

-- Subconsulta en FROM (tabla derivada)
SELECT ciudad, media_salarial
FROM (
    SELECT ciudad, ROUND(AVG(salario),2) AS media_salarial
    FROM empleados
    GROUP BY ciudad
) AS medias
WHERE media_salarial > 2000;

-- EXISTS: comprobar existencia
SELECT nombre FROM clientes c
WHERE EXISTS (
    SELECT 1 FROM pedidos p WHERE p.id_cliente = c.id
);

-- IN con subconsulta
SELECT nombre FROM empleados
WHERE ciudad IN (SELECT DISTINCT ciudad FROM empleados WHERE salario > 2500);
