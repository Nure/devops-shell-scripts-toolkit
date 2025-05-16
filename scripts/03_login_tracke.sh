#!/bin/bash

LOGFILE="/var/log/auth.log" # Use /var/log/secure on RedHat/CentOS
OUTPUT="login_report.txt"

echo "User Login Report for $(date)" > "$OUTPUT"
echo "--------------------------------" >> "$OUTPUT"
grep "session opened for user" "$LOGFILE" | awk '{print $1, $2, $3, $11}' >> "$OUTPUT"

echo "Report saved to $OUTPUT"

# May require sudo access to read /var/log/auth.log.

