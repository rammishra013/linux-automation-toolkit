#!/bin/bash

set -u

PROJECT_DIR="$HOME/projects/linux-automation-toolkit"
LOG_DIR="$PROJECT_DIR/logs"
BACKUP_DIR="$PROJECT_DIR/backups"

SOURCE_DIR="$HOME/lab-data/application"

LOG_FILE="$LOG_DIR/backup.log"

mkdir -p "$LOG_DIR"
mkdir -p "$BACKUP_DIR"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $*" | tee -a "$LOG_FILE"
}

if [ ! -d "$SOURCE_DIR" ]; then
    log "ERROR: Source directory does not exist."
    exit 1
fi

BACKUP_NAME="application_backup_$(date +%Y%m%d_%H%M%S).tar.gz"

BACKUP_PATH="$BACKUP_DIR/$BACKUP_NAME"

log "Backup started."

if tar -czf "$BACKUP_PATH" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"; then
    if tar -tzf "$BACKUP_PATH" >/dev/null; then
        log "Backup verified: $BACKUP_PATH"
    else
        log "ERROR: Backup archive validation failed."
        exit 1
    fi
else
    log "ERROR: Backup creation failed."
    exit 1
fi

log "Backup completed successfully."
