#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Launch polybar, using default config
for m in $(xrandr --query | rg " connected" | cut -d" " -f1)
do
  MONITOR=$m polybar --reload mybar 2>&1 | tee -a /tmp/polybar.log & disown
done
nitrogen --restore
echo "Polybar launched..."
