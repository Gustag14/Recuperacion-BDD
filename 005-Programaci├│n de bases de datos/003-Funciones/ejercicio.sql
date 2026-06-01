-- 003 - Funciones de usuario

DELIMITER //

-- Función que calcula el IVA de un precio
CREATE FUNCTION calcular_iva(precio DECIMAL(10,2), porcentaje DECIMAL(5,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN precio * (porcentaje / 100);
END //

-- Función que formatea un nombre completo
CREATE FUNCTION nombre_completo(nombre VARCHAR(100), apellidos VARCHAR(150))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    RETURN CONCAT(TRIM(apellidos), ', ', TRIM(nombre));
END //

DELIMITER ;

-- Usar las funciones
SELECT calcular_iva(100.00, 21) AS iva_21;
SELECT nombre_completo('María', 'García López') AS nombre;

-- Ver todas las funciones creadas
SHOW FUNCTION STATUS WHERE Db = DATABASE();
