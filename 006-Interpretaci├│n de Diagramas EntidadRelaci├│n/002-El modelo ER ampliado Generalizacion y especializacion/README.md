# Modelo ER ampliado: Generalización, Especialización y Agregación

## Generalización
Proceso de abstraer atributos comunes de varias entidades en una superentidad.

```
[Empleado]   [Cliente]
     \           /
    (Generalización)
          |
       [Persona]
```

## Especialización
Lo contrario: a partir de una entidad general, derivar subentidades con atributos propios.

```
       [Vehículo]
      /           \
[Coche]         [Camión]
 atributo:        atributo:
 n_puertas        tonelaje
```

## Tipos de especialización
- **Total**: todo elemento de la superentidad pertenece a alguna subentidad
- **Parcial**: puede haber elementos que no pertenezcan a ninguna subentidad
- **Disjunta**: un elemento solo puede pertenecer a una subentidad
- **Solapada**: un elemento puede pertenecer a varias subentidades

## Agregación
Tratar una relación como si fuera una entidad para relacionarla con otra.

```
[Empleado] -- (Trabaja en) -- [Proyecto]
             (Agregación)
                  |
             [usa_herramienta]
                  |
           [Herramienta]
```
