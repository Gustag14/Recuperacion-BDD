-- 002 - Variables de sistema y de usuario

-- Variables de usuario (prefijo @)
SET @nombre := 'Juan';
SET @salario := 2500;
SELECT @nombre AS nombre, @salario AS salario;

-- Variable resultado de una consulta
SELECT @total := COUNT(*) FROM empleados;
SELECT @total AS total_empleados;

-- Variables de sistema (prefijo @@)
SELECT @@version        AS version_mysql;
SELECT @@datadir        AS directorio_datos;
SELECT @@max_connections AS max_conexiones;

-- Modificar variable de sistema de sesión
SET @@SESSION.sql_mode = 'STRICT_TRANS_TABLES';
SELECT @@SESSION.sql_mode;
