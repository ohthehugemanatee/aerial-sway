# Aerial screensaver for Linux/Sway/Wayland

I saw my friend's laptop with the aerial screensaver running and I couldn't resist copying it for my Linux machine running swaywm.

Source video files are freely available from sylvan.apple.com. Included in this repo is a script to download them and build a VLC playlist of the local copies, because a) sylvan.apple.com has certificate problems that break vlc streams and b) screensavers should work independently of your internet connection. 

This script assumes you are running [SwayWM](https://swaywm.org/). If you're using another compositor, you'll have to modify `aerial-wayland.sh`... but it's not a complicated script. I believe in you.

# Requirements

You must have installed:

- aria2c : To download these large files in parallel.
- vlc : To play the videos

You will need to tweak `aerial-wayland.sh` if you:

- use a screensaver other than `swaylock`
- have a multi-monitor setup. You have to specify which displays to disable during the screensaver.

You will need to make bigger changes to `aerial-wayland.sh` if you want to run with a compositor other than SwayWM. 

# Installation / Setup

1. Run `./setup.sh` to download the videos and create a playlist.
2. Make any necessary customizations to the variables at the top of `aerial-wayland.sh`
3. Configure your display manager to use `aerial-wayland.sh` as the screensaver. For example through `swayidle`.

# Video resolution / other video files

The source videos are all in 4K resolution. The complete list of available files is in entries.json, originally from sylvan.apple.com.  If you prefer 2K resolution, you can rebuild `to-download.txt`, clear the videos from your videos directory, and re-run `setup.sh`.

``` bash
rm -rf videos/*.mov
cat entries.json | jq -r '.assets[]."url-2K-HDR"' > to-download.txt
./setup.sh
```

Note that this requires `jq`.

# Maintenance

This project is only maintained as I need to make changes. Feel free to submit Issues and PRs, but review will be slow and occasional.

