#!/bin/sh

# Start swww daemon if not running
pgrep -x swww || swww-daemon

# Pick a random image from your wallpaper folder
WALLPAPER=$(find ~/Pictures/wp -type f | shuf -n 1)

# Set the image with a smooth transition
swww img "$WALLPAPER" --transition-type any --transition-duration 2
