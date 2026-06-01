# Herramientas de los SGBD no relacionales

## MongoDB
| Herramienta | Descripción |
|------------|-------------|
| mongosh    | CLI interactiva |
| MongoDB Compass | GUI visual |
| MongoDB Atlas | Servicio cloud gestionado |
| mongoexport/mongoimport | Exportar/importar JSON, CSV |
| mongodump/mongorestore | Backup binario |

## Redis
| Herramienta | Descripción |
|------------|-------------|
| redis-cli  | CLI interactiva |
| RedisInsight | GUI visual |
| redis-benchmark | Pruebas de rendimiento |

## Comandos Redis básicos
```bash
# Conectar
redis-cli

# Operaciones básicas
SET clave "valor"
GET clave
DEL clave
EXISTS clave
EXPIRE clave 3600    # expira en 1 hora
TTL clave            # tiempo restante

# Listas
RPUSH lista "a" "b" "c"
LRANGE lista 0 -1

# Hashes
HSET usuario:1 nombre "Ana" edad 25
HGETALL usuario:1
```
