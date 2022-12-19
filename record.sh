#!/bin/sh
#get resolution and fps via xrandr
ffmpeg -video_size $1 -framerate $2 -f x11grab -i :0.0 -f pulse -ac 2 -i default output.mp4

