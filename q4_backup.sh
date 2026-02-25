#!/bin/bash
# Q4 - Automated Backup Script

echo "=== AUTOMATED BACKUP SCRIPT ==="

read -p "Enter directory to backup: " SOURCE
read -p "Enter backup destination: " DEST

if [ ! -d "$SOURCE" ]; then
    echo "Source directory does not exist."
    exit 1
fi

mkdir -p "$DEST"

echo "Backup Type:"
echo "1. Simple copy"
echo "2. Compressed archive (tar.gz)"
read -p "Enter choice: " TYPE

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
START=$(date +%s)

echo "[*] Starting backup..."

if [ "$TYPE" == "1" ]; then
    cp -r "$SOURCE" "$DEST/backup_$TIMESTAMP"
    BACKUP_FILE="$DEST/backup_$TIMESTAMP"
else
    tar -czf "$DEST/backup_$TIMESTAMP.tar.gz" "$SOURCE"
    BACKUP_FILE="$DEST/backup_$TIMESTAMP.tar.gz"
fi

END=$(date +%s)
DURATION=$((END - START))

if [ -e "$BACKUP_FILE" ]; then
    SIZE=$(du -sh "$BACKUP_FILE" | cut -f1)
    echo "Backup completed successfully!"
    echo "File: $(basename $BACKUP_FILE)"
    echo "Location: $DEST"
    echo "Size: $SIZE"
    echo "Time taken: $DURATION seconds"
else
    echo "Backup failed."
fi