-- 005 - Composiciones internas (INNER JOIN)

CREATE TABLE categorias (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80)
);

CREATE TABLE articulos (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    nombre      VARCHAR(150),
    precio      DECIMAL(8,2),
    id_categoria INT
);

INSERT INTO categorias (nombre) VALUES ('Electrónica'), ('Hogar'), ('Deportes');
INSERT INTO articulos (nombre, precio, id_categoria) VALUES
    ('Smartphone', 699.00, 1),
    ('Sofá',       450.00, 2),
    ('Bicicleta',  320.00, 3),
    ('Tablet',     299.00, 1),
    ('Lámpara',     45.00, 2);

-- INNER JOIN: solo devuelve filas con coincidencia en ambas tablas
SELECT a.nombre AS articulo, a.precio, c.nombre AS categoria
FROM articulos a
INNER JOIN categorias c ON a.id_categoria = c.id;

-- Con filtro
SELECT a.nombre, a.precio
FROM articulos a
INNER JOIN categorias c ON a.id_categoria = c.id
WHERE c.nombre = 'Electrónica'
ORDER BY a.precio DESC;

-- JOIN con alias más cortos
SELECT ar.nombre, cat.nombre AS cat
FROM articulos ar JOIN categorias cat ON ar.id_categoria = cat.id;
