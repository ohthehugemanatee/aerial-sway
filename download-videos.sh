#!/bin/bash

set -eu

# Download the screensaver videos from sylvan.apple.com to the videos directory.

# Requires aria2c for parallel connections.

aria2c -x 16 -s 16 -i to-download.txt --check-certificate=false -d "${PWD}/videos" && echo "--- Download successful ---"
