-- 001 - Modelo de datos
-- Definimos un modelo sencillo para una tienda

-- Tabla de categorías
CREATE TABLE categorias (
    id   INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla de productos
CREATE TABLE productos (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    nombre       VARCHAR(150) NOT NULL,
    precio       DECIMAL(8,2) NOT NULL,
    id_categoria INT
);

-- Insertar algunos datos de prueba
INSERT INTO categorias (nombre) VALUES ('Electrónica'), ('Ropa'), ('Alimentación');

INSERT INTO productos (nombre, precio, id_categoria) VALUES
    ('Auriculares', 29.99, 1),
    ('Camiseta', 12.50, 2),
    ('Aceite de oliva', 5.75, 3);

SELECT * FROM productos;
