#!/bin/bash

services=("nginx" "ssh" "cron")

for service in "${services[@]}"; do
    if systemctl is-active --quiet "$service"; then
        echo "$service is running."
    else
        echo "$service is NOT running."
    fi
done
