#!/bin/bash
if [ $1 == "off" ]
then
  xrandr --output DP2 --off
elif [ $1 == "on" ]
then
  xrandr --output DP2 --mode 1368x768_60.00 --left-of eDP1
fi

sleep 4
nitrogen --restore
picom -CGb --experimental-backends
/home/bdreece/.config/polybar/launch.sh
/home/bdreece/.conky/launch.sh
