-- 008 - Combinación de múltiples selecciones (UNION, INTERSECT, EXCEPT)

CREATE TABLE proveedores_es (id INT PRIMARY KEY, nombre VARCHAR(100), ciudad VARCHAR(80));
CREATE TABLE proveedores_fr (id INT PRIMARY KEY, nombre VARCHAR(100), ciudad VARCHAR(80));

INSERT INTO proveedores_es VALUES (1,'Suministros SL','Madrid'),(2,'TechParts','Barcelona'),(3,'GlobalMat','Valencia');
INSERT INTO proveedores_fr VALUES (1,'Fournitures SA','París'),(2,'TechParts','Lyon'),(3,'EuroSupply','Marsella');

-- UNION: combina resultados (elimina duplicados)
SELECT nombre FROM proveedores_es
UNION
SELECT nombre FROM proveedores_fr;

-- UNION ALL: combina resultados (conserva duplicados)
SELECT nombre, ciudad FROM proveedores_es
UNION ALL
SELECT nombre, ciudad FROM proveedores_fr
ORDER BY nombre;

-- Simulación de INTERSECT con JOIN
SELECT e.nombre
FROM proveedores_es e
INNER JOIN proveedores_fr f ON e.nombre = f.nombre;
