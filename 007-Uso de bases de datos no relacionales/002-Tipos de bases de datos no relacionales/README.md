# Tipos de bases de datos no relacionales

## 1. Clave-Valor
- Datos como pares `clave → valor`
- Ultra-rápidas en lectura/escritura
- **Ejemplo**: Redis, DynamoDB

```
SET usuario:1001 '{"nombre":"Ana","email":"ana@mail.com"}'
GET usuario:1001
```

## 2. Documentales
- Almacenan documentos JSON/BSON
- Permiten consultas sobre los campos del documento
- **Ejemplo**: MongoDB, CouchDB

```json
{
  "_id": "abc123",
  "nombre": "Producto X",
  "precio": 29.99,
  "etiquetas": ["electrónica", "oferta"]
}
```

## 3. Columnares (wide-column)
- Optimizadas para lecturas analíticas (OLAP)
- Cada fila puede tener columnas diferentes
- **Ejemplo**: Apache Cassandra, HBase

## 4. Grafos
- Nodos y aristas con propiedades
- Ideales para redes sociales, recomendaciones
- **Ejemplo**: Neo4j, ArangoDB

## 5. Series temporales
- Optimizadas para datos con marca de tiempo
- **Ejemplo**: InfluxDB, TimescaleDB
