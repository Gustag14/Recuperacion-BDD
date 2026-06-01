"""
Proyecto: Leer un fichero ODS e importarlo a MySQL
Requiere: pip install odfpy mysql-connector-python
"""

import mysql.connector
from odf.opendocument import load
from odf.table import Table, TableRow, TableCell
from odf.text import P

def leer_ods(ruta: str) -> list[list]:
    """Lee la primera hoja de un archivo ODS y devuelve una lista de filas."""
    doc = load(ruta)
    hoja = doc.spreadsheet.getElementsByType(Table)[0]
    filas = []
    for fila in hoja.getElementsByType(TableRow):
        celdas = []
        for celda in fila.getElementsByType(TableCell):
            parrafos = celda.getElementsByType(P)
            valor = str(parrafos[0]) if parrafos else ""
            repeticiones = int(celda.getAttribute("number-columns-repeated") or 1)
            celdas.extend([valor] * repeticiones)
        filas.append(celdas)
    return filas


def importar_a_mysql(filas: list[list]):
    """Inserta las filas del ODS en una tabla MySQL."""
    conn = mysql.connector.connect(
        host="localhost", user="root", password="", database="proyecto_crud"
    )
    cursor = conn.cursor()

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS importados (
            id     INT AUTO_INCREMENT PRIMARY KEY,
            col1   VARCHAR(255),
            col2   VARCHAR(255),
            col3   VARCHAR(255)
        )
    """)

    # Saltar la fila de cabeceras (índice 0)
    for fila in filas[1:]:
        if any(fila):  # ignorar filas completamente vacías
            cursor.execute(
                "INSERT INTO importados (col1, col2, col3) VALUES (%s, %s, %s)",
                (fila[0] if len(fila) > 0 else "",
                 fila[1] if len(fila) > 1 else "",
                 fila[2] if len(fila) > 2 else "")
            )

    conn.commit()
    print(f"Importadas {cursor.rowcount} filas")
    cursor.close()
    conn.close()


if __name__ == "__main__":
    import sys
    ruta = sys.argv[1] if len(sys.argv) > 1 else "datos.ods"
    filas = leer_ods(ruta)
    print(f"Filas leídas: {len(filas)}")
    importar_a_mysql(filas)
