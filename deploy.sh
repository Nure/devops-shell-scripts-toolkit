#!/bin/bash

# =======================
# Simple Auto-Deploy Script
# =======================

REPO_DIR="$HOME/projects/myapp"
LOG_FILE="$REPO_DIR/deploy.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "[$DATE] Starting deployment..." | tee -a "$LOG_FILE"

# Step 1: Go to the repo
cd "$REPO_DIR" || {
    echo "[$DATE] ERROR: Could not find repo directory." | tee -a "$LOG_FILE"
    exit 1
}

# Step 2: Pull latest changes
echo "[$DATE] Pulling latest changes from Git..." | tee -a "$LOG_FILE"
git pull origin main >> "$LOG_FILE" 2>&1

# Step 3: Stop existing app (simulate)
echo "[$DATE] Stopping current app instance..." | tee -a "$LOG_FILE"
pkill -f "python3 app.py" >> "$LOG_FILE" 2>&1 || echo "No running instance found." | tee -a "$LOG_FILE"

# Step 4: Build/setup (simulated here)
echo "[$DATE] Running setup..." | tee -a "$LOG_FILE"
# For real apps: pip install, npm install, docker build, etc.
chmod +x app.py

# Step 5: Start the app
echo "[$DATE] Starting app..." | tee -a "$LOG_FILE"
nohup python3 app.py >> app_output.log 2>&1 &

# Step 6: Confirm it started
sleep 1
if pgrep -f "python3 app.py" > /dev/null; then
    echo "[$DATE] Deployment successful!" | tee -a "$LOG_FILE"
else
    echo "[$DATE] ERROR: App failed to start." | tee -a "$LOG_FILE"
fi


