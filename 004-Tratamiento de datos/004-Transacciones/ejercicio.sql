-- 004 - Transacciones (ACID)

-- Ejemplo: transferencia bancaria entre dos cuentas

CREATE TABLE cuentas (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    titular VARCHAR(100),
    saldo  DECIMAL(10,2) NOT NULL CHECK (saldo >= 0)
);

INSERT INTO cuentas (titular, saldo) VALUES ('Cuenta A', 1000.00), ('Cuenta B', 500.00);

-- Transacción correcta
START TRANSACTION;
    UPDATE cuentas SET saldo = saldo - 200 WHERE titular = 'Cuenta A';
    UPDATE cuentas SET saldo = saldo + 200 WHERE titular = 'Cuenta B';
COMMIT;

SELECT * FROM cuentas;

-- Transacción con ROLLBACK (en caso de error)
START TRANSACTION;
    UPDATE cuentas SET saldo = saldo - 9999 WHERE titular = 'Cuenta A';
    -- Detectamos que el saldo quedaría negativo
ROLLBACK;

SELECT * FROM cuentas;  -- Los valores no han cambiado

-- SAVEPOINT
START TRANSACTION;
    UPDATE cuentas SET saldo = saldo + 50 WHERE titular = 'Cuenta A';
    SAVEPOINT punto1;
    UPDATE cuentas SET saldo = saldo - 50 WHERE titular = 'Cuenta B';
    ROLLBACK TO SAVEPOINT punto1;  -- deshacemos solo la segunda operación
COMMIT;
