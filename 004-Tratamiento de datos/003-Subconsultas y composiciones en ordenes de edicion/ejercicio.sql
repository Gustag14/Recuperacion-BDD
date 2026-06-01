-- 003 - Subconsultas en UPDATE / DELETE

-- Subir precio un 5% a todos los artículos de la categoría 'Electrónica'
UPDATE articulos
SET precio = precio * 1.05
WHERE id_categoria = (
    SELECT id FROM categorias WHERE nombre = 'Electrónica'
);

-- Eliminar pedidos de clientes inactivos
DELETE FROM pedidos
WHERE id_cliente IN (
    SELECT id FROM clientes WHERE activo = 0
);

-- UPDATE con JOIN (sintaxis MySQL)
UPDATE articulos a
JOIN categorias c ON a.id_categoria = c.id
SET a.precio = a.precio * 0.95
WHERE c.nombre = 'Hogar';

-- Verificar resultado
SELECT a.nombre, a.precio, c.nombre AS categoria
FROM articulos a JOIN categorias c ON a.id_categoria = c.id;
