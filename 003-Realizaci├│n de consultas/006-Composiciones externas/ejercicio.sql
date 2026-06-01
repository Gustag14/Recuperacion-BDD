-- 006 - Composiciones externas (LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN)

CREATE TABLE clientes (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE pedidos (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    total      DECIMAL(9,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

INSERT INTO clientes (nombre) VALUES ('Luis', 'Sara', 'Roberto', 'Patricia');
INSERT INTO pedidos (id_cliente, total) VALUES (1, 120.50), (1, 89.00), (3, 45.00);
-- Sara (2) y Patricia (4) no tienen pedidos

-- LEFT JOIN: todos los clientes aunque no tengan pedidos
SELECT c.nombre, p.total
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.id_cliente;

-- Clientes SIN ningún pedido
SELECT c.nombre
FROM clientes c
LEFT JOIN pedidos p ON c.id = p.id_cliente
WHERE p.id IS NULL;

-- RIGHT JOIN: todos los pedidos (aunque el cliente no exista)
SELECT c.nombre, p.total
FROM clientes c
RIGHT JOIN pedidos p ON c.id = p.id_cliente;
