#!/bin/bash
set -e

source .env  # ← załaduj zmienne

CONTAINER="paskowe-typy-config-db-1"
DB_NAME="paskowe_typy"
BACKUP_FILE="backup_$(date +%Y%m%d_%H%M%S).dump"

echo "Tworzenie zrzutu bazy..."
docker exec "$CONTAINER" pg_dump -U "$DB_USERNAME" -d "$DB_NAME" -F c -f "/tmp/$BACKUP_FILE"

echo "Kopiowanie z kontenera..."
docker cp "$CONTAINER:/tmp/$BACKUP_FILE" "./$BACKUP_FILE"

echo "Usuwanie pliku z kontenera..."
docker exec "$CONTAINER" rm "/tmp/$BACKUP_FILE"

echo "Gotowe: $BACKUP_FILE"