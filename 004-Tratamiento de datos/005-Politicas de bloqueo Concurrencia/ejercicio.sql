-- 005 - Políticas de bloqueo y concurrencia

-- Niveles de aislamiento en MySQL
-- READ UNCOMMITTED, READ COMMITTED, REPEATABLE READ (por defecto), SERIALIZABLE

-- Ver nivel de aislamiento actual
SELECT @@transaction_isolation;

-- Cambiar nivel de aislamiento para la sesión
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Bloqueo explícito de filas (FOR UPDATE)
START TRANSACTION;
SELECT * FROM cuentas WHERE titular = 'Cuenta A' FOR UPDATE;
-- Otras sesiones esperan hasta que hagamos COMMIT o ROLLBACK
UPDATE cuentas SET saldo = saldo + 100 WHERE titular = 'Cuenta A';
COMMIT;

-- LOCK TABLES / UNLOCK TABLES
LOCK TABLES cuentas WRITE;
    UPDATE cuentas SET saldo = 0 WHERE id = 99;  -- id inexistente
UNLOCK TABLES;

-- Restaurar nivel de aislamiento
SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
