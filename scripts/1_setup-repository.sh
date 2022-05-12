#!/bin/bash

# STEP 1
# creates folders and repository

GIT="$(which git)"
DOTBOT_DIR="$1"

mkdir -p "$DOTBOT_DIR"
cd "$DOTBOT_DIR" || exit
$GIT init

echo "# STEP 1 completed"
echo ""