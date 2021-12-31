#!/bin/sh


xrdb -merge ~/.X196.dpi
xrandr --fbmm 6720x3780 --output HDMI-A-0 --pos 0x0 --primary --mode 3840x2160 --scale 1x1 --output eDP --pos 3840x0 --mode 1920x1080 --scale 1.5x1.5
xrandr --output HDMI-A-0 --scale 0.9999x0.9999

bspc wm -r 
