#!/bin/bash

set -u

PROJECT_DIR="$HOME/projects/linux-automation-toolkit"
LOG_DIR="$PROJECT_DIR/logs"
LOG_FILE="$LOG_DIR/service_check.log"

SERVICE_NAME="${1:-nginx}"

mkdir -p "$LOG_DIR"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $*" | tee -a "$LOG_FILE"
}

log "Checking service: $SERVICE_NAME"

if systemctl is-active --quiet "$SERVICE_NAME"; then
    log "OK: $SERVICE_NAME is running."
else
    log "WARNING: $SERVICE_NAME is not running."
fi
