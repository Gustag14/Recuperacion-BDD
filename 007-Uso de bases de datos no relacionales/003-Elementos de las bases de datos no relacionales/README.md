# Elementos de las bases de datos no relacionales

## MongoDB – Conceptos clave

| Concepto RDBMS | Equivalente MongoDB |
|----------------|---------------------|
| Base de datos  | Base de datos       |
| Tabla          | Colección           |
| Fila / tupla   | Documento           |
| Columna        | Campo               |
| JOIN           | $lookup (agregación)|
| INDEX          | Index               |

## Estructura de un documento
```json
{
  "_id": ObjectId("64a1b2c3d4e5f6789abcdef0"),
  "nombre": "Juan García",
  "edad": 30,
  "direccion": {
    "calle": "Mayor 12",
    "ciudad": "Madrid",
    "cp": "28001"
  },
  "telefonos": ["600111222", "912345678"],
  "activo": true,
  "creado_en": ISODate("2025-01-15T10:30:00Z")
}
```

## Índices en MongoDB
```javascript
// Índice simple
db.clientes.createIndex({ email: 1 }, { unique: true })

// Índice compuesto
db.pedidos.createIndex({ id_cliente: 1, fecha: -1 })

// Ver índices
db.clientes.getIndexes()
```
