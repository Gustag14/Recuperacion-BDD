# Características de las bases de datos no relacionales (NoSQL)

## ¿Por qué NoSQL?
Las BD relacionales tienen limitaciones ante:
- Enormes volúmenes de datos (Big Data)
- Alta velocidad de escritura/lectura
- Datos con estructura variable o dinámica

## Características principales
| Característica | Descripción |
|---------------|-------------|
| Esquema flexible | No requieren un esquema fijo (schema-less) |
| Escalabilidad horizontal | Se escalan añadiendo más nodos (sharding) |
| Alta disponibilidad | Replicación nativa incorporada |
| Consistencia eventual | Pueden priorizar disponibilidad sobre consistencia (teorema CAP) |
| Modelo de datos variado | Documentos, grafos, clave-valor, columnas |

## Teorema CAP
Solo se pueden garantizar 2 de estas 3 propiedades:
- **C**onsistency (Consistencia)
- **A**vailability (Disponibilidad)
- **P**artition tolerance (Tolerancia a particiones)
