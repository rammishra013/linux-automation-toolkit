#!/bin/bash

set -u

PROJECT_DIR="$HOME/projects/linux-automation-toolkit"
LOG_DIR="$PROJECT_DIR/logs"
LOG_FILE="$LOG_DIR/health_check.log"

mkdir -p "$LOG_DIR"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $*" | tee -a "$LOG_FILE"
}

log "===== Health Check Started ====="

log "Hostname: $(hostname)"
log "Uptime: $(uptime -p)"

CPU_LOAD=$(awk '{print $1}' /proc/loadavg)
log "CPU Load Average (1 minute): $CPU_LOAD"

MEMORY_USAGE=$(free | awk '/Mem:/ {printf "%.2f", $3/$2 * 100}')
log "Memory Usage: ${MEMORY_USAGE}%"

DISK_USAGE=$(df -P / | awk 'NR==2 {print $5}')
log "Root Disk Usage: $DISK_USAGE"

log "===== Health Check Completed ====="
