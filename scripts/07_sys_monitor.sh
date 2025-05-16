#!/bin/bash

OUTPUT="system_metrics.csv"

# CSV Header
echo "Time,CPU Load,Free RAM,Disk Usage (%)" > "$OUTPUT"

while true; do
    TIME=$(date '+%Y-%m-%d %H:%M:%S')
    LOAD=$(top -bn1 | grep "load average:" | awk '{print $10 $11 $12}' | tr -d ',')
    FREE_RAM=$(free -m | awk '/Mem:/ {print $4}')
    DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')
    
    echo "$TIME,$LOAD,$FREE_RAM MB,$DISK_USAGE" >> "$OUTPUT"
    sleep 60
done

# Run in background and analyze the CSV output later.