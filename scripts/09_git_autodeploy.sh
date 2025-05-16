#!/bin/bash

REPO_DIR="$HOME/projects/myapp"
REMOTE_REPO="https://github.com/your-org/myapp.git"
BRANCH="main"

cd "$REPO_DIR" || exit

while true; do
    git fetch origin "$BRANCH"
    LOCAL=$(git rev-parse "$BRANCH")
    REMOTE=$(git rev-parse origin/"$BRANCH")

    if [ "$LOCAL" != "$REMOTE" ]; then
        echo "New changes found! Pulling and deploying..."
        git pull origin "$BRANCH"
        ./deploy.sh
    else
        echo "No changes. Sleeping..."
    fi
    sleep 60
done

