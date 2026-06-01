"""
Proyecto: Exportar tabla a CSV y volver a importar
"""

import csv
import mysql.connector
from datetime import datetime

CONN = dict(host="localhost", user="root", password="", database="proyecto_crud")


def exportar_csv(tabla: str, archivo: str):
    conn = mysql.connector.connect(**CONN)
    cursor = conn.cursor()
    cursor.execute(f"SELECT * FROM {tabla}")
    columnas = [desc[0] for desc in cursor.description]
    filas = cursor.fetchall()

    with open(archivo, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(columnas)
        writer.writerows(filas)

    print(f"Exportadas {len(filas)} filas a '{archivo}'")
    cursor.close()
    conn.close()


def importar_csv(archivo: str, tabla: str):
    conn = mysql.connector.connect(**CONN)
    cursor = conn.cursor()
    insertados = 0

    with open(archivo, newline="", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for fila in reader:
            # Ignorar la columna 'id' para que AUTO_INCREMENT funcione
            fila.pop("id", None)
            cols = ", ".join(fila.keys())
            placeholders = ", ".join(["%s"] * len(fila))
            cursor.execute(
                f"INSERT INTO {tabla} ({cols}) VALUES ({placeholders})",
                list(fila.values())
            )
            insertados += 1

    conn.commit()
    print(f"Importadas {insertados} filas desde '{archivo}'")
    cursor.close()
    conn.close()


if __name__ == "__main__":
    ts = datetime.now().strftime("%Y%m%d_%H%M%S")
    archivo = f"productos_{ts}.csv"
    exportar_csv("productos", archivo)
    # importar_csv(archivo, "productos")  # Descomentar para reimportar
