#!/bin/bash

# Starts the screensaver using the playlist and videos created by setup.sh . There are no arguments.

# ********
# Before first run, please check these variables against your own system: 
# ********

# If you have a multi-monitor setup (even sometimes), which outputs to disable during the screensaver. Get the names of all your outputs from `swaymsg -t get_outputs` . Separate each output with a space.
DISABLE_OUTPUTS=eDP1

# Program to use for locking the screen.
LOCKER=/usr/bin/swaylock

# ********
# No other modifications should be necessary.
# ********

SCRIPTDIR=$(dirname -- "$( readlink -f -- \"$0\"; )")

# Exit if the screen is already locked.
LOCKERBIN=$(basename "${LOCKER}")
if pgrep -x "${LOCKERBIN}" > /dev/null; then
  exit 0
fi

# If multiple outputs, disable according to ${DISABLE_OUTPUTS}.
toggle_outputs() {
  for OUTPUT_NAME in ${DISABLE_OUTPUTS}; do
    /usr/bin/swaymsg output ${OUTPUT_NAME} dpms $1
  done 
}

COUNT_OUTPUTS=$(swaymsg -t get_outputs | jq '. | length' | tr -d '\n')
if [ $COUNT_OUTPUTS -gt 1 ]; then
  OUTPUTS_DISABLED=true
  toggle_outputs off
fi

/usr/bin/cvlc -Z "${SCRIPTDIR}/videos/playlist.m3u" --fullscreen --no-mouse-events --no-keyboard-events  --loop --no-osd --no-audio --video-wallpaper & /usr/bin/swaylock -c 00000000 && kill -9 $!

$OUTPUTS_DISABLED && toggle_outputs on
