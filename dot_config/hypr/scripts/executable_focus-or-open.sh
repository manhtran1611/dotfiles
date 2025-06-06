#!/bin/sh

# first argument is name of executable
# second argument is name of class
# check if first and second argument is given
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <executable> <class:kitty> | <pid:012345> | <title:kitty>"
  exit 1
fi

# if response is not "ok", then exec the executable
if ! hyprctl dispatch focuswindow "$2" | grep -q "ok"; then
  # if executable is not running, then exec it
  if ! pgrep -x "$1" >/dev/null; then
    exec "$1"
  fi
fi
