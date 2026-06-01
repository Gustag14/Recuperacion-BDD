-- 010 - Usuarios y privilegios

-- Crear un usuario solo para lectura
CREATE USER 'lector'@'localhost' IDENTIFIED BY 'Pass1234!';
GRANT SELECT ON mi_base_de_datos.* TO 'lector'@'localhost';

-- Crear un usuario con todos los privilegios sobre una BD
CREATE USER 'admin_app'@'localhost' IDENTIFIED BY 'Admin5678!';
GRANT ALL PRIVILEGES ON mi_base_de_datos.* TO 'admin_app'@'localhost';

-- Ver privilegios de un usuario
SHOW GRANTS FOR 'lector'@'localhost';

-- Revocar un privilegio
REVOKE INSERT ON mi_base_de_datos.* FROM 'lector'@'localhost';

-- Aplicar cambios
FLUSH PRIVILEGES;

-- Eliminar un usuario
-- DROP USER 'lector'@'localhost';
