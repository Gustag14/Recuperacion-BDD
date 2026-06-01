-- 003 - Paso del diagrama ER al modelo relacional

-- Reglas:
-- 1. Cada entidad fuerte → tabla con su clave primaria
-- 2. Cada entidad débil → tabla con clave de la entidad propietaria + clave parcial
-- 3. Relación 1:N → se añade la FK en la tabla del lado N
-- 4. Relación N:M → se crea una tabla intermedia con las dos FK
-- 5. Relación 1:1 → se añade la FK en cualquiera de las dos tablas

-- Ejemplo: Sistema de gestión de proyectos

-- Entidades fuertes
CREATE TABLE departamentos (
    id_dep  INT AUTO_INCREMENT PRIMARY KEY,
    nombre  VARCHAR(100) NOT NULL
);

CREATE TABLE empleados (
    id_emp  INT AUTO_INCREMENT PRIMARY KEY,
    nombre  VARCHAR(150) NOT NULL,
    id_dep  INT,
    FOREIGN KEY (id_dep) REFERENCES departamentos(id_dep)  -- 1:N
);

CREATE TABLE proyectos (
    id_proy  INT AUTO_INCREMENT PRIMARY KEY,
    titulo   VARCHAR(200) NOT NULL,
    presupuesto DECIMAL(12,2)
);

-- Relación N:M entre empleados y proyectos
CREATE TABLE participa (
    id_emp   INT NOT NULL,
    id_proy  INT NOT NULL,
    horas    INT DEFAULT 0,
    PRIMARY KEY (id_emp, id_proy),
    FOREIGN KEY (id_emp)  REFERENCES empleados(id_emp),
    FOREIGN KEY (id_proy) REFERENCES proyectos(id_proy)
);

-- Entidad débil: tarea depende de proyecto
CREATE TABLE tareas (
    num_tarea INT NOT NULL,
    id_proy   INT NOT NULL,
    descripcion TEXT,
    PRIMARY KEY (num_tarea, id_proy),
    FOREIGN KEY (id_proy) REFERENCES proyectos(id_proy) ON DELETE CASCADE
);
