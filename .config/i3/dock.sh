#!/bin/bash
if [ $1 == "off" ]
then
  xrandr --output DP2 --off
elif [ $1 == "on" ]
then
  xrandr --output DP2 --mode 1368x768_60.00 --above eDP1
fi

for pid in $(pgrep conky)
do
  kill -9 $pid
done

sleep 4
nitrogen --restore
picom -CGb --experimental-backends
/home/bdreece/.config/polybar/launch.sh
conky -c "/home/bdreece/.conky/TeejeeTech/Process Panel"
conky -c "/home/bdreece/.conky/TeejeeTech/Network Panel"
