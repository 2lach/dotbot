#!/bin/bash

## this needs some work

DOTBOT_DIR="$1"

# keepalive loop
log_this () {
while true; do
	logname="$(date +"%d-%m-%Y")"
	echo "$@" | tee > "$DOTBOT_DIR/logfile-$logname.log"
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &
}

log_this;
echo "Dotbot is starting"