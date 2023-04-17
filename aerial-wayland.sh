#!/bin/bash

if pgrep -x "swaylock" > /dev/null; then
  exit 0
fi

COUNT_OUTPUTS=$(swaymsg -t get_outputs | jq '. | length' | tr -d '\n')

if [ $COUNT_OUTPUTS -gt 1 ]; then
  EDP1_DISABLED=true
  /usr/bin/swaymsg output eDP-1 dpms off
fi

/usr/bin/cvlc -Z /home/ohthehugemanatee/Projects/personal/screensaver/playlist.m3u --fullscreen --no-mouse-events --no-keyboard-events  --loop --no-osd --no-audio --video-wallpaper & /usr/bin/swaylock -c 00000000 && kill -9 $!

$EDP1_DISABLED && /usr/bin/swaymsg output eDP-1 dpms on
