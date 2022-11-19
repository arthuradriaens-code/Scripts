#!/bin/sh
PERCENTAGE=$(cat /sys/class/power_supply/BAT0/capacity)
notify-send "🔋: $PERCENTAGE %"
