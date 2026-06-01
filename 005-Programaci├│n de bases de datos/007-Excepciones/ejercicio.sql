-- 007 - Manejo de excepciones (DECLARE HANDLER)

DELIMITER //

CREATE PROCEDURE insertar_seguro(
    IN p_nombre VARCHAR(100),
    IN p_email  VARCHAR(150)
)
BEGIN
    DECLARE duplicado INT DEFAULT 0;

    -- Handler para error de clave duplicada (código 1062)
    DECLARE CONTINUE HANDLER FOR 1062
        SET duplicado = 1;

    INSERT INTO socios (nombre, email) VALUES (p_nombre, p_email);

    IF duplicado = 1 THEN
        SELECT CONCAT('Ya existe un socio con email: ', p_email) AS aviso;
    ELSE
        SELECT 'Socio insertado correctamente' AS resultado;
    END IF;
END //

-- Manejo genérico con SQLEXCEPTION
CREATE PROCEDURE operacion_critica()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error: se ha deshecho la transacción' AS mensaje;
    END;

    START TRANSACTION;
        UPDATE cuentas SET saldo = saldo - 500 WHERE titular = 'Cuenta A';
        UPDATE cuentas SET saldo = saldo + 500 WHERE titular = 'Cuenta B';
    COMMIT;
    SELECT 'Transferencia completada' AS mensaje;
END //

DELIMITER ;

CALL insertar_seguro('Carlos', 'carlos@mail.com');
CALL insertar_seguro('Carlos 2', 'carlos@mail.com');  -- email duplicado
