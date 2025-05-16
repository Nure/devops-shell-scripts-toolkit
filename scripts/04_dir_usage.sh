#!/bin/bash

TARGET=${1:-$HOME}

echo "Disk usage in $TARGET"
echo "----------------------"
du -sh "$TARGET"/* 2>/dev/null | sort -hr | head -n 10

# Run as ./dir_usage.sh /some/path or let it default to home.