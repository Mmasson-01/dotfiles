#!/bin/bash

# Set keyboard layout
setxkbmap -model pc104 -layout us,ca -option grp:alt_shift_toggle

# For rotated screen
xrandr --output DisplayPort-0 --primary --mode 3840x2160 --pos 0x750 --rotate normal --output DisplayPort-1 --mode 3840x2160 --pos 3840x0 --rotate right --output HDMI-A-0 --off --output HDMI-A-1 --off --output DVI-D-0 --off
