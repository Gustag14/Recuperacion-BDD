# Sistemas gestores de BD no relacionales

## MongoDB
- Documental, JSON/BSON
- Consultas ricas con aggregation pipeline
- Instalación: `sudo apt install mongodb`

## Redis
- Clave-valor en memoria
- Usado como caché, colas de mensajes, sesiones
- Instalación: `sudo apt install redis-server`

## Apache Cassandra
- Wide-column, distribuida
- Lenguaje CQL (parecido a SQL)
- Ideal para IoT y logs masivos

## Neo4j
- Base de datos de grafos
- Lenguaje Cypher
- Ideal para redes sociales y recomendaciones

## Comparativa

| SGBD       | Tipo         | Caso de uso principal      |
|------------|--------------|---------------------------|
| MongoDB    | Documental   | Catálogos, CMS, IoT        |
| Redis      | Clave-valor  | Caché, sesiones, tiempo real|
| Cassandra  | Columnar     | Big Data, escritura masiva  |
| Neo4j      | Grafos       | Redes sociales, fraude      |
| InfluxDB   | Temporal     | Métricas, monitorización    |
