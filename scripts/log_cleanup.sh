#!/bin/bash

set -u

PROJECT_DIR="$HOME/projects/linux-automation-toolkit"
LOG_DIR="$PROJECT_DIR/logs"
LOG_FILE="$LOG_DIR/log_cleanup.log"

TARGET_DIR="$HOME/lab-data/log-cleanup"
RETENTION_DAYS=7

mkdir -p "$LOG_DIR"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $*" | tee -a "$LOG_FILE"
}

if [ ! -d "$TARGET_DIR" ]; then
    log "ERROR: Target directory does not exist."
    exit 1
fi

log "Cleanup started."
log "Target: $TARGET_DIR"
log "Retention: $RETENTION_DAYS days"

find "$TARGET_DIR" -type f -mtime +"$RETENTION_DAYS" -print

find "$TARGET_DIR" -type f -mtime +"$RETENTION_DAYS" -delete

log "Cleanup completed."
