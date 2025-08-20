#!/bin/bash
# Backup diario de Postgres para n8n

# Fecha en formato YYYY-MM-DD
DATE=$(date +%F)

# Carpeta de backups
BACKUP_DIR=./backups
mkdir -p $BACKUP_DIR

# Nombre del archivo
FILENAME=$BACKUP_DIR/n8n_backup_$DATE.sql

# Ejecutar el dump desde el contenedor de postgres
docker exec -t n8n_postgres pg_dump -U n8n n8n > $FILENAME

# Opcional: borrar backups viejos (mantener 7 días)
find $BACKUP_DIR -type f -name "*.sql" -mtime +7 -delete
