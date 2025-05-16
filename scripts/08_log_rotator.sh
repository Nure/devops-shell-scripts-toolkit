#!/bin/bash

LOG_DIR="/var/log/myapp"
ROTATE_DIR="/var/log/myapp/archive"
mkdir -p "$ROTATE_DIR"

for file in "$LOG_DIR"/*.log; do
    if [ -f "$file" ]; then
        base=$(basename "$file")
        DATE=$(date +%F-%H%M)
        gzip -c "$file" > "$ROTATE_DIR/${base}_${DATE}.gz"
        : > "$file"  # Truncate original log
    fi
done

echo "Logs rotated and archived."


# What Problem we are trying to solve:
# 1. Logs grow continuously and can fill up disk space.

# 2. Large logs are hard to analyze or load.

# 3. Rotation means: archive old logs, start fresh ones.

# After running this, You'll see app_YYYY-MM-DD-HHMM.log.gz and a truncated app.log.