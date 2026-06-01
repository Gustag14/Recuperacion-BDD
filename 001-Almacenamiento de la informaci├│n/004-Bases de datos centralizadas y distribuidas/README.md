# Bases de datos centralizadas y distribuidas

## Centralizada
- Un único servidor almacena todos los datos
- Ventaja: más sencilla de administrar
- Inconveniente: punto único de fallo

## Distribuida
Los datos se reparten en varios nodos de red.

### Técnicas de fragmentación
- **Horizontal**: cada nodo almacena un subconjunto de filas
- **Vertical**: cada nodo almacena un subconjunto de columnas
- **Mixta**: combinación de ambas

### Ejemplo de fragmentación horizontal
```
Nodo A → clientes con id 1-500
Nodo B → clientes con id 501-1000
```
