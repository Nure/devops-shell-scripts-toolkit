#!/bin/bash

SERVICES=("nginx" "ssh" "docker")
LOGFILE="service_health.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "[$DATE] Service Health Check" >> "$LOGFILE"

for service in "${SERVICES[@]}"; do
    status=$(systemctl is-active "$service")
    echo "$service: $status" >> "$LOGFILE"
done

echo "Log written to $LOGFILE"

# Try restarting/stopping services and see the log.