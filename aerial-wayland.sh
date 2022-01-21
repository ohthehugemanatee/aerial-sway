#!/bin/bash


COUNT_OUTPUTS=$(swaymsg -t get_outputs | jq '. | length' | tr -d '\n')

if [ $COUNT_OUTPUTS -gt 1 ]; then
  swaymsg output eDP-1 disable
fi
cvlc -Z /home/ohthehugemanatee/tmp/screensaver/playlist.m3u --fullscreen --no-mouse-events --no-keyboard-events  --loop --no-osd --no-audio --video-wallpaper & swaylock -c 00000000 && kill $!


if [ $COUNT_OUTPUTS -gt 1 ]; then
  swaymsg output eDP-1 enable
fi
