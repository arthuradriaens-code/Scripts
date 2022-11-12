#!/bin/sh
ffmpeg -video_size 1280x800 -framerate 25 -f x11grab -i :0.0+0,0 -c:v libx264rgb -crf 0 -preset ultrafast sample.mkv
