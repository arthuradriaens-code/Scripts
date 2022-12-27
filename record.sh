#!/bin/sh
#get resolution and fps via xrandr
#
if [ $# -eq 1 ] && [ "$1" = "-h" ]
  then
    echo "\n"
    echo "First argument: Video size, e.g 1920x1080\n"
    echo "Second argument: framerate, e.g 60\n"
    echo "\n"
    exit 0
fi

ffmpeg -video_size $1 -framerate $2 -f x11grab -i :0.0 -f pulse -ac 2 -i default output.mp4
