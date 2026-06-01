-- 003 - Tipos de datos en MySQL

CREATE TABLE ejemplos_tipos (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    entero      INT,                        -- número entero
    decimal_num DECIMAL(10,2),              -- número decimal
    texto_corto VARCHAR(255),               -- cadena de longitud variable
    texto_largo TEXT,                       -- texto largo
    fecha       DATE,                       -- solo fecha
    fecha_hora  DATETIME,                   -- fecha + hora
    booleano    TINYINT(1) DEFAULT 0,       -- 0=false, 1=true
    binario     BLOB                        -- datos binarios
);

INSERT INTO ejemplos_tipos (entero, decimal_num, texto_corto, texto_largo, fecha, fecha_hora, booleano)
VALUES (42, 3.14, 'Hola mundo', 'Este es un texto largo de ejemplo.', '2025-01-15', NOW(), 1);

SELECT * FROM ejemplos_tipos;
