#!/bin/bash

pkill -9 conky

for m in $(xrandr --query | rg " connected" | cut -d " " -f1)
do
  conky -X $m -c "/home/bdreece/.conky/TeejeeTech/Process Panel"
  conky -X $m -c "/home/bdreece/.conky/TeejeeTech/Network Panel"
done
