#!/bin/bash

SOURCE_DIR="$HOME/Documents"
BACKUP_DIR="$HOME/backups"

mkdir -p "$BACKUP_DIR"
DATE=$(date +%F)
FILENAME="backup-$DATE.tar.gz"

tar -czf "$BACKUP_DIR/$FILENAME" "$SOURCE_DIR"
echo "Backup completed: $BACKUP_DIR/$FILENAME"
