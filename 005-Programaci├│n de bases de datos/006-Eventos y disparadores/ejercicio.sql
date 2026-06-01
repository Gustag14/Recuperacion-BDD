-- 006 - Disparadores (TRIGGERS) y Eventos

-- --- TRIGGERS ---
CREATE TABLE log_cambios (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    tabla      VARCHAR(50),
    accion     VARCHAR(10),
    descripcion TEXT,
    fecha      DATETIME DEFAULT NOW()
);

DELIMITER //

-- Trigger AFTER INSERT en empleados
CREATE TRIGGER tg_empleado_insert
AFTER INSERT ON empleados
FOR EACH ROW
BEGIN
    INSERT INTO log_cambios (tabla, accion, descripcion)
    VALUES ('empleados', 'INSERT', CONCAT('Nuevo empleado: ', NEW.nombre));
END //

-- Trigger BEFORE UPDATE en empleados (validación)
CREATE TRIGGER tg_empleado_salario
BEFORE UPDATE ON empleados
FOR EACH ROW
BEGIN
    IF NEW.salario < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salario inválido';
    END IF;
END //

-- --- EVENTOS ---
-- Habilitar el planificador de eventos
SET GLOBAL event_scheduler = ON;

-- Evento que se ejecuta cada día a medianoche
CREATE EVENT ev_limpieza_logs
ON SCHEDULE EVERY 1 DAY
STARTS '2025-01-01 00:00:00'
DO
    DELETE FROM log_cambios WHERE fecha < DATE_SUB(NOW(), INTERVAL 30 DAY);
//

DELIMITER ;

-- Probar el trigger
INSERT INTO empleados (nombre, ciudad, salario) VALUES ('Trigger Test', 'Málaga', 2000);
SELECT * FROM log_cambios;
