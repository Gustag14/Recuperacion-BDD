# Normalización de modelos relacionales

La normalización elimina redundancias y dependencias problemáticas.

## Formas normales

### 1FN (Primera Forma Normal)
- Todos los atributos son atómicos (sin grupos repetitivos)
- Ejemplo de violación: `telefonos VARCHAR` con varios números separados por comas

### 2FN (Segunda Forma Normal)
- Cumple 1FN
- Todo atributo no clave depende de **toda** la clave primaria (no de una parte)

### 3FN (Tercera Forma Normal)
- Cumple 2FN
- No existen dependencias transitivas: A → B → C (siendo A la PK)

### FNBC (Forma Normal de Boyce-Codd)
- Versión más estricta de la 3FN

## Ejemplo de normalización

**Tabla sin normalizar:**
```
pedido_id | cliente_nombre | cliente_ciudad | producto | precio
```

**Normalizada (3FN):**
```
clientes(cliente_id, nombre, ciudad)
productos(producto_id, nombre, precio)
pedidos(pedido_id, cliente_id FK, producto_id FK)
```
