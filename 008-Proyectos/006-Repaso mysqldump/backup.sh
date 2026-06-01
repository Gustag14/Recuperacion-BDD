#!/bin/bash
# Script de backup con mysqldump

DB_HOST="localhost"
DB_USER="root"
DB_PASS=""
DB_NAME="proyecto_crud"
BACKUP_DIR="./backups"
FECHA=$(date +"%Y%m%d_%H%M%S")
ARCHIVO="$BACKUP_DIR/${DB_NAME}_${FECHA}.sql"

mkdir -p "$BACKUP_DIR"

# Realizar el backup
mysqldump -h "$DB_HOST" -u "$DB_USER" ${DB_PASS:+-p"$DB_PASS"} \
    --single-transaction \
    --routines \
    --triggers \
    "$DB_NAME" > "$ARCHIVO"

if [ $? -eq 0 ]; then
    echo "Backup creado: $ARCHIVO"
    gzip "$ARCHIVO"
    echo "Comprimido: ${ARCHIVO}.gz"
else
    echo "ERROR: el backup ha fallado"
    exit 1
fi

# Eliminar backups con más de 7 días
find "$BACKUP_DIR" -name "*.gz" -mtime +7 -delete
echo "Backups antiguos eliminados"
