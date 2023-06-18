#!/usr/bin/env sh

DIR="$HOME/.config/polybar/custom"

# Create env variable for polybar CPU temp.
for i in /sys/class/hwmon/hwmon*/temp*_input; do 
    if [ "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*}))" = "coretemp: temp1_input" ]; then
        export HWMON_PATH="$i"
    fi
done

killall -q polybar

# Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -q top -c "$DIR"/config.ini &
polybar -q bottom -c "$DIR"/config.ini &

# polybar --reload --quiet top -c ~/.config/polybar/custom/config.ini &
# polybar --reload --quiet top -c ~/.config/polybar/custom/config.ini &
