#!/bin/sh
PERCENTAGE=$(cat /sys/class/power_supply/BAT0/capacity)
LOWLIM=10
ALARMLIM=5
HIGHLIM=95
PLUGGEDSTATE=$(cat /sys/class/power_supply/AC/online)
ISPLUGGED=1

if [ "$ALARMLIM" -ge "$PERCENTAGE" ] && [ "$PLUGGEDSTATE" -ne "$ISPLUGGED" ] ; then
	mpv extra/mixkit-alarm-tone-996.wav &
fi

if [ "$LOWLIM" -ge "$PERCENTAGE" ] && [ "$PLUGGEDSTATE" -ne "$ISPLUGGED" ] ; then
	notify-send "🪫 Battery is at $PERCENTAGE %, consider charging"
fi

if [ "$HIGHLIM" -le "$PERCENTAGE" ] && [ "$PLUGGEDSTATE" -eq "$ISPLUGGED" ] ; then
	notify-send "🔋 Battery is fully charged"
fi
