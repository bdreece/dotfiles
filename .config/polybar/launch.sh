#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Launch polybar, using default config
for m in $(xrandr --query | rg " connected" | cut -d" " -f1)
do
  MONITOR=$m polybar -r mybar
done
nitrogen --restore
echo "Polybar launched..."
