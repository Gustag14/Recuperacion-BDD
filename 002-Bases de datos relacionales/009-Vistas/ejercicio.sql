-- 009 - Vistas

CREATE TABLE alumnos (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    nota   DECIMAL(4,2)
);

INSERT INTO alumnos (nombre, nota) VALUES
    ('María', 8.5), ('Pedro', 4.0), ('Laura', 9.0), ('Tomás', 5.5);

-- Vista de alumnos aprobados
CREATE VIEW vista_aprobados AS
    SELECT id, nombre, nota
    FROM alumnos
    WHERE nota >= 5;

-- Usar la vista como si fuera una tabla
SELECT * FROM vista_aprobados ORDER BY nota DESC;

-- Vista con datos calculados
CREATE VIEW vista_estadisticas AS
    SELECT
        COUNT(*)        AS total,
        AVG(nota)       AS media,
        MAX(nota)       AS maxima,
        MIN(nota)       AS minima
    FROM alumnos;

SELECT * FROM vista_estadisticas;
