# Aerial screensaver for Linux/Wayland

I saw my friend's laptop with the aerial screensaver running and I couldn't resist copying it for my Linux machine.

Source video files are freely available from sylvan.apple.com. Included in this repo is a script to download them and build a VLC playlist of the local copies.

# Requirements

You must have installed:

- aria2c : To download these large files in parallel.
- vlc : To play the videos

You will need to tweak `aerial-wayland.sh` if you:

- use a screensaver other than `swaylock`
- have a multi-monitor setup. You have to specify which displays to disable during the screensaver.

# Installation / Setup

1. Run `./download-videos.sh` to download the videos and create a playlist.
2. Make any necessary customizations to the variables at the top of `aerial-wayland.sh`
3. Configure your display manager to use `aerial-wayland.sh` as the screensaver. For example through `swayidle`.


# Maintenance

This project is only maintained as I need to make changes. Feel free to submit Issues and PRs, but review will be slow and occasional.

