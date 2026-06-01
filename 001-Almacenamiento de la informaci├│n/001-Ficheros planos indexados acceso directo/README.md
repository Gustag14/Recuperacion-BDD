# Ficheros: planos, indexados y de acceso directo

## Tipos de ficheros

| Tipo | Descripción |
|------|-------------|
| Fichero plano | Datos en texto sin estructura, separados por delimitadores |
| Fichero indexado | Contiene un índice para acceder rápidamente a los registros |
| Acceso directo | Se accede a cualquier registro por su posición (clave) sin leer los anteriores |

## Ejemplo práctico en Python

```python
# Escritura de un fichero plano CSV
with open("clientes.csv", "w") as f:
    f.write("id,nombre,email\n")
    f.write("1,Ana García,ana@email.com\n")
    f.write("2,Luis Pérez,luis@email.com\n")

# Lectura
with open("clientes.csv", "r") as f:
    for linea in f:
        print(linea.strip())
```
