# Restricciones semánticas del modelo relacional

## Tipos de restricciones
1. **Integridad de dominio**: los valores de un atributo deben ser del tipo y rango correcto
   - Ejemplo: edad INT CHECK (edad > 0 AND edad < 130)

2. **Integridad de entidad**: ninguna clave primaria puede ser NULL
   - Garantizada automáticamente con PRIMARY KEY

3. **Integridad referencial**: si existe una FK, debe apuntar a un valor existente (o ser NULL)
   - Gestionada con FOREIGN KEY + ON DELETE/UPDATE

4. **Restricciones de usuario**: reglas de negocio específicas
   - Ejemplo: el saldo de una cuenta nunca puede ser negativo
   - Implementado con CHECK o TRIGGER

## Implementación
```sql
CREATE TABLE contratos (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT NOT NULL,
    fecha_ini   DATE NOT NULL,
    fecha_fin   DATE,
    salario     DECIMAL(9,2) CHECK (salario > 0),
    -- fecha_fin debe ser posterior a fecha_ini
    CHECK (fecha_fin IS NULL OR fecha_fin > fecha_ini),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_emp)
);
```
