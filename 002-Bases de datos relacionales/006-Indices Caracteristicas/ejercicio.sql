-- 006 - Índices

CREATE TABLE articulos (
    id       INT AUTO_INCREMENT PRIMARY KEY,
    codigo   VARCHAR(20) NOT NULL,
    nombre   VARCHAR(150),
    precio   DECIMAL(8,2)
);

-- Índice único en código
CREATE UNIQUE INDEX idx_codigo ON articulos(codigo);

-- Índice normal para búsquedas por nombre
CREATE INDEX idx_nombre ON articulos(nombre);

-- Ver índices de la tabla
SHOW INDEX FROM articulos;

-- Insertar datos y probar rendimiento
INSERT INTO articulos (codigo, nombre, precio) VALUES
    ('ART001', 'Teclado mecánico', 89.99),
    ('ART002', 'Ratón inalámbrico', 34.50);

-- Consulta que usará el índice idx_nombre
SELECT * FROM articulos WHERE nombre = 'Teclado mecánico';
