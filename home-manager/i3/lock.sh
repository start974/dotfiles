#!/bin/sh -xe
icon="$(realpath $(dirname $0))/lock_icon.png"

# create a temp file
img=$(mktemp /tmp/XXXXXXXXXX.png)

# Take a screenshot of current desktop
import -window root $img

# blur the screenshot (slow!)
convert $img -blur 5,5 $img

# Add the lock image
convert $img $icon -gravity center -composite $img

# Run i3lock with custom background
i3lock -i $img

# Remove the tmp file
rm $img
