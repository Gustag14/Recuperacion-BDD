-- 004 - Agrupamiento con GROUP BY y HAVING

-- Agrupación de ventas por producto
SELECT producto, SUM(cantidad) AS total_unidades, SUM(cantidad*precio) AS facturacion
FROM ventas
GROUP BY producto;

-- GROUP BY con ORDER BY
SELECT producto, SUM(cantidad*precio) AS facturacion
FROM ventas
GROUP BY producto
ORDER BY facturacion DESC;

-- HAVING: filtrar grupos (equivale a WHERE pero sobre el resultado agregado)
SELECT producto, SUM(cantidad) AS total_unidades
FROM ventas
GROUP BY producto
HAVING total_unidades > 3;

-- GROUP BY fecha (mes)
SELECT DATE_FORMAT(fecha, '%Y-%m') AS mes, SUM(cantidad*precio) AS ingresos
FROM ventas
GROUP BY mes
ORDER BY mes;
