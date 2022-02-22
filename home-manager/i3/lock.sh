#!/bin/sh -xe

current="$(realpath $(dirname $0))"
icon="${current}/lock_icon.png"
# create a temp file
img=$(mktemp /tmp/XXXXXXXXXX.png)

# Take a screenshot of current desktop
import -window root $img

# blur the screenshot (slow!)
#convert $img -blur 5,5 $img

# Add the lock image
convert $img $icon -gravity center -composite $img

# Run i3lock with custom background
betterlockscreen -u $img --fx blur --blur 0.9
betterlockscreen -l blur

# Remove the tmp file
rm $img

# re-add wallpaper to cache
betterlockscreen -w dim
