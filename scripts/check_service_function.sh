#!/bin/bash

check_service() {
    service_name="$1"

    if systemctl is-active --quiet "$service_name"; then
        echo "$service_name is running."
    else
        echo "$service_name is NOT running."
    fi
}

check_service nginx
check_service docker
check_service ssh
