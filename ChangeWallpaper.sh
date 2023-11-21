#!/bin/bash
pkill xwinwrap
pkill mpv

xwinwrap -ov -ni -g 1920x1080 -- mpv --fullscreen -no-stop-screensaver --loop-file --no-audio --no-osc --no-osd-bar -wid WID --no-input-default-bindings /home/arthur/.local/share/Steam/steamapps/workshop/content/431960/827148653/Gargantua_BGM.mp4&

xwinwrap -ov -ni -g 3840x2160+1920+0 -- mpv --fullscreen -no-stop-screensaver --loop-file --no-audio --no-osc --no-osd-bar -wid WID --no-input-default-bindings /home/arthur/.local/share/Steam/steamapps/workshop/content/431960/827148653/Gargantua_BGM.mp4&
