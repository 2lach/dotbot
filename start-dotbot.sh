#!/bin/bash

DOTBOT_DIR="$HOME/projects/dotbot"

# keepalive loop
log_this () {
while true; do
	logname="$(date +"%d-%m-%Y")"
	echo "$@" | tee > "$DOTBOT_DIR/logfile-$logname.log"
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &
}




printf "Dotbot is about to start, have you filled in the config files?\nThat would be files.txt and folders.txt (y/n): "  && read -r answer

# intro
[[ "$answer" == *"y"* ]] && echo "Do you want to proceed? (y/n)" && read -r answer
[ ! "$answer" == "y" ] && echo "you probably should do that then" && exit 1
[[ "$answer" == *"y"* ]] && echo "alrite then let's go"

# config
echo "First some minor config choices (you can exit any time with ctrl+c)"
echo "Do you want Dotbot to use the default DOTBOT_DIR ($HOME/projects/dotbot) (y/n)" && read -r answer
[[ "$answer" == *"y"* ]] && echo "ok, roger that"
[ ! "$answer" == "y" ] && echo "alrite, please enter the path where you want Dotbot to setup" && read -r dotbotpath
echo "is this correct? ($dotbotpath) (y/n)" && read -r answer
[ ! "$answer" == "y" ] && echo "alrite, please enter the path where you want Dotbot to setup" && read -r dotbotpath
[ "$answer" == "y" ] && echo "ok, roger that"
DOTBOT_DIR="$dotbotpath"

# the logging loop needs some looking over
# echo "Before Dotbots starts do you want a dotbot to create a logfile? (y/n)" && read -r logfile
# [ "$logfile" == "y" ] && echo "ok, roger that" && log_this "Dotbot is about to start"
# [ "$logfile" == "n" ] && echo "ok, roger that"

echo "1) Dotbot is scafolding folders and repository"
./scripts/1_setup-repository.sh "$DOTBOT_DIR"

echo "2) Dotbot is creating files"
./scripts/2_add-gitfiles.sh "$DOTBOT_DIR"

echo "Dotbot is coping your files and folders"
./scripts/3_copy_files_folder "$DOTBOT_DIR"

echo "Dotbot is done"