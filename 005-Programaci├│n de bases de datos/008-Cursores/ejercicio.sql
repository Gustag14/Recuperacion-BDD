-- 008 - Cursores

DELIMITER //

-- Cursor que recorre empleados y acumula su salario total
CREATE PROCEDURE total_salarios_cursor()
BEGIN
    DECLARE fin         INT DEFAULT 0;
    DECLARE emp_nombre  VARCHAR(100);
    DECLARE emp_salario DECIMAL(9,2);
    DECLARE acumulado   DECIMAL(12,2) DEFAULT 0;

    -- Declarar el cursor
    DECLARE cur_empleados CURSOR FOR
        SELECT nombre, salario FROM empleados;

    -- Handler para fin de cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1;

    OPEN cur_empleados;

    bucle: LOOP
        FETCH cur_empleados INTO emp_nombre, emp_salario;
        IF fin = 1 THEN
            LEAVE bucle;
        END IF;
        SET acumulado = acumulado + emp_salario;
    END LOOP;

    CLOSE cur_empleados;

    SELECT acumulado AS salario_total_acumulado;
END //

DELIMITER ;

CALL total_salarios_cursor();
