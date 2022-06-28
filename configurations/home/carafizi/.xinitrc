#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# stop screen from going blank
xset s off
xset -dpms
xset noblank

# Faster key repeat and delay
xset r rate 210 40

# configure monitors
xrandr --output DisplayPort-0 --primary --mode 1920x1080 --rate 165.00 --set TearFree on --output HDMI-A-0 --auto --left-of DisplayPort-0

# load random wallpaper
feh --randomize --bg-fill ~/Pictures/Wallpapers/*

# configure mouse high DPI mouse
xinput --set-prop 8 'libinput Accel Speed' -1

# starts window managers
exec i3
