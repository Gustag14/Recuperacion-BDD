-- 004 - Estructuras de control de flujo

DELIMITER //

-- IF / ELSEIF / ELSE
CREATE PROCEDURE clasificar_nota(IN nota DECIMAL(4,2))
BEGIN
    DECLARE calificacion VARCHAR(20);

    IF nota >= 9 THEN
        SET calificacion = 'Sobresaliente';
    ELSEIF nota >= 7 THEN
        SET calificacion = 'Notable';
    ELSEIF nota >= 5 THEN
        SET calificacion = 'Aprobado';
    ELSE
        SET calificacion = 'Suspenso';
    END IF;

    SELECT nota, calificacion;
END //

-- CASE
CREATE PROCEDURE dia_semana(IN num INT)
BEGIN
    SELECT CASE num
        WHEN 1 THEN 'Lunes'
        WHEN 2 THEN 'Martes'
        WHEN 3 THEN 'Miércoles'
        WHEN 4 THEN 'Jueves'
        WHEN 5 THEN 'Viernes'
        WHEN 6 THEN 'Sábado'
        WHEN 7 THEN 'Domingo'
        ELSE 'Número no válido'
    END AS dia;
END //

-- WHILE
CREATE PROCEDURE contar_hasta(IN limite INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i <= limite DO
        SELECT i AS numero;
        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;

CALL clasificar_nota(7.5);
CALL dia_semana(3);
CALL contar_hasta(3);
