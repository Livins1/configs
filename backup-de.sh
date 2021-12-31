#!/bin/sh
# $0 $1 $2 $3

config_home=${XDG_CONFIG_HOME}
if [ $config_home ]
then
	echo "Conifg Home Exits!"
	echo "XDG_CONFIG_HOME: " $config_home
else
	echo "Config Home Error!"
	exit 1
fi



#DstApplicationPath
dst_sway="${XDG_CONFIG_HOME}/sway/"
dst_waybar="${XDG_CONFIG_HOME}/waybar/"
dst_wofi="${XDG_CONFIG_HOME}/wofi/"

if [ -d $dst_sway ];then
	mkdir -p ./sway && cp -r $dst_sway/* $_
else
  echo "Sway Not Found"
fi

if [ -d $dst_waybar ];then
	mkdir -p ./waybar && cp -r $dst_waybar/* $_
else
  echo "Waybar Not Found"
fi

if [ -d $dst_wofi ];then
	mkdir -p ./wofi && cp -r $dst_wofi/* $_
else
  echo "Wofi Not Found"
fi




echo "Backup Finished !"
