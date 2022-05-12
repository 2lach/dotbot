#!/bin/bash

# STEP 2
# creates files

DOTBOT_DIR="$HOME/projects/dotbot"
DIRECTORY=".git"

cd "$DOTBOT_DIR" || exit

# if there is a .git folder
[ -d "$DIRECTORY" ] && touch .gitignore .gitattributes .gitmodules index.txt logfile.txt

# if there isnt a .git folder
[ ! -d "$DIRECTORY" ] && index.txt logfile.txt

echo "# STEP 2 completed"
echo ""