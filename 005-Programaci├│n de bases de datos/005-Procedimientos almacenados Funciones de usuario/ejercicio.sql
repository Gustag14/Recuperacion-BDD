-- 005 - Procedimientos almacenados

DELIMITER //

-- Procedimiento con parámetros IN y OUT
CREATE PROCEDURE obtener_estadisticas(
    IN  tabla_ciudad  VARCHAR(80),
    OUT total         INT,
    OUT salario_medio DECIMAL(10,2)
)
BEGIN
    SELECT COUNT(*), AVG(salario)
    INTO total, salario_medio
    FROM empleados
    WHERE ciudad = tabla_ciudad;
END //

-- Procedimiento para insertar un empleado con validación
CREATE PROCEDURE insertar_empleado(
    IN p_nombre    VARCHAR(100),
    IN p_ciudad    VARCHAR(80),
    IN p_salario   DECIMAL(9,2)
)
BEGIN
    IF p_salario < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El salario no puede ser negativo';
    END IF;

    INSERT INTO empleados (nombre, ciudad, salario) VALUES (p_nombre, p_ciudad, p_salario);
    SELECT LAST_INSERT_ID() AS nuevo_id;
END //

DELIMITER ;

-- Llamadas
CALL obtener_estadisticas('Madrid', @total, @media);
SELECT @total AS total_madrid, @media AS media_salarial_madrid;

CALL insertar_empleado('Pepe', 'Sevilla', 1950.00);
