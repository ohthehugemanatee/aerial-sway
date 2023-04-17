#!/bin/bash

set -eu

# Set up the screensaver:
# 
# 1. Download the screensaver videos from sylvan.apple.com to the videos directory.
# 2. Create a vlc playlist file with the local paths to those videos

# Requires aria2c for parallel connections.

aria2c -x 16 -s 16 -i to-download.txt --summary-interval=0 --check-certificate=false -d "${PWD}/videos" && echo "--- Download successful ---"

find ${PWD}/videos/*.mov > "${PWD}/videos/playlist.m3u"

echo "--- Playlist created. ---"

echo "Now tweak any variables necessary in aerial-wayland.sh and you're ready to go!"
