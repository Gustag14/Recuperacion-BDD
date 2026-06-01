# El modelo ER: Entidades, Relaciones, Cardinalidades y Debilidad

## Entidades
Una **entidad** representa un objeto del mundo real sobre el que almacenamos información.
- Entidad fuerte: tiene clave propia (ej. Cliente, Producto)
- Entidad débil: depende de otra entidad para identificarse (ej. Línea de pedido depende de Pedido)

## Atributos
- **Simple**: valor único (nombre)
- **Compuesto**: formado por varios sub-atributos (dirección = calle + ciudad + CP)
- **Multivaluado**: puede tener varios valores (teléfonos)
- **Derivado**: se calcula a partir de otro (edad ← fecha_nacimiento)

## Relaciones y cardinalidades
| Notación | Significado |
|----------|-------------|
| 1:1      | Un cliente tiene una cuenta bancaria |
| 1:N      | Un autor escribe muchos libros |
| N:M      | Muchos alumnos cursan muchos módulos |

## Ejemplo textual
```
[Cliente] ---1--- (Realiza) ---N--- [Pedido]
[Pedido]  ---1--- (Contiene) ---N--- [Linea_Pedido] (débil)
```
