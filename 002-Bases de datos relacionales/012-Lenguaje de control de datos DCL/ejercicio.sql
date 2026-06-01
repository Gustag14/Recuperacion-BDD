-- 012 - DCL (Data Control Language)
-- GRANT, REVOKE

-- Crear base de datos de ejemplo
CREATE DATABASE IF NOT EXISTS tienda_db;

-- Conceder permisos específicos
GRANT SELECT, INSERT, UPDATE ON tienda_db.* TO 'vendedor'@'%';

-- Conceder solo lectura en una tabla específica
GRANT SELECT ON tienda_db.productos TO 'invitado'@'localhost';

-- Ver permisos otorgados
SHOW GRANTS FOR 'vendedor'@'%';

-- Revocar permisos
REVOKE UPDATE ON tienda_db.* FROM 'vendedor'@'%';

FLUSH PRIVILEGES;
