#!/bin/bash

set -u

PROJECT_DIR="$HOME/projects/linux-automation-toolkit"
LOG_DIR="$PROJECT_DIR/logs"
LOG_FILE="$LOG_DIR/disk_alert.log"
THRESHOLD=80

mkdir -p "$LOG_DIR"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $*" | tee -a "$LOG_FILE"
}

DISK_USAGE=$(df -P / | awk 'NR==2 {gsub("%","",$5); print $5}')

log "Current Disk Usage: ${DISK_USAGE}%"
log "Threshold: ${THRESHOLD}%"

if [ "$DISK_USAGE" -ge "$THRESHOLD" ]; then
    log "WARNING: Disk usage is above threshold!"
else
    log "OK: Disk usage is within limits."
fi
