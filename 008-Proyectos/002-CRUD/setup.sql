CREATE DATABASE IF NOT EXISTS proyecto_crud;
USE proyecto_crud;

CREATE TABLE productos (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    precio DECIMAL(8,2) NOT NULL DEFAULT 0,
    stock  INT NOT NULL DEFAULT 0
);

INSERT INTO productos (nombre, precio, stock) VALUES
    ('Producto A', 19.99, 100),
    ('Producto B', 45.00, 50),
    ('Producto C', 8.75, 200);
