#!/bin/sh


xrdb -merge ~/.X144.dpi
xrandr --fbmm 4480x2520 --output DisplayPort-1 --pos 0x0 --primary --mode 2560x1440 --scale 1x1 --output eDP --pos 0x1440 --mode 1920x1080 --scale 1.5x1.5
xrandr --output DisplayPort-1 --scale 0.9999x0.9999

bspc wm -r 
