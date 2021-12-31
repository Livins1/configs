#! /bin/sh

run() { ! pgrep -x "$1" >/dev/null && "$@"; }


# 設置觸摸板
xinput set-prop --type=int --format=8 "SYNA30BF:00 06CB:CE09 Touchpad" 309 1

# 关闭休眠
xset s 3600 3600
xset -dpms 
xsetroot -cursor_name left_ptr &

# setxkbmap -layout us,ru -option "grp:alt_shift_toggle,grp_led:scroll" &
fcitx5 &
# picom -b --config $HOME/.config/picom.conf &
# hsetroot -fill /usr/share/wall/ctld.png &
run nitrogen --restore &
run sxhkd -c $HOME/.config/sxhkd/sxhkdrc &
if [ "$(which polybar)" != "polybar not found" ]; then
  $HOME/.config/polybar/launch.sh &
  # (sleep 2; sh ~/.bin/phide.sh) &
fi
# run tint2 -c $HOME/.config/tint2/tray.tint2rc &
run dunst &
if [ "$(which thunar)" != "thunar not found" ]; then
  thunar --daemon &
fi
# numlockx &
xsettingsd &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
gnome-keyring-daemon --start --components=pkcs11 &

# greenclip daemon &
