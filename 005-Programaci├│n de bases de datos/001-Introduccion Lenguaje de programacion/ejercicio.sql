-- 001 - Introducción a la programación en MySQL

-- MySQL permite procedimientos almacenados, funciones, disparadores y eventos.
-- El delimitador hay que cambiarlo para que el cliente no interprete los ";" internos.

DELIMITER //

CREATE PROCEDURE saludo()
BEGIN
    SELECT 'Hola desde MySQL!' AS mensaje;
END //

DELIMITER ;

-- Llamar al procedimiento
CALL saludo();
