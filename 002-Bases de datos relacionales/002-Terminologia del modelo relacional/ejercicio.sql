-- 002 - Terminología del modelo relacional
-- Relación (tabla), tupla (fila), atributo (columna), dominio, clave primaria, clave foránea

CREATE TABLE departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre          VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE empleados (
    id_empleado     INT AUTO_INCREMENT PRIMARY KEY,   -- clave primaria
    dni             CHAR(9)      NOT NULL UNIQUE,     -- clave candidata
    nombre          VARCHAR(80)  NOT NULL,
    salario         DECIMAL(9,2) DEFAULT 0.00,
    id_departamento INT,                              -- clave foránea
    FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);

-- Insertar tuplas (filas / registros)
INSERT INTO departamentos (nombre) VALUES ('Ventas'), ('TI'), ('RRHH');
INSERT INTO empleados (dni, nombre, salario, id_departamento)
    VALUES ('12345678A', 'Marta López', 2200.00, 2),
           ('87654321B', 'Carlos Ruiz', 1800.00, 1);

SELECT * FROM empleados;
