#!/bin/bash
pkill xwinwrap
pkill mpv
currenttime=$(date +%H:%M)
if [[ "$currenttime" > "16:30" ]] || [[ "$currenttime" < "06:30" ]]; then
    xwinwrap -ov -ni -g 1920x1080 -- mpv --fullscreen -no-stop-screensaver --loop-file --no-audio --no-osc --no-osd-bar -wid WID --no-input-default-bindings /home/arthur/.local/share/Steam/steamapps/workshop/content/431960/2956215523/moonset.mp4&

    xwinwrap -ov -ni -g 3840x2160+1920+0 -- mpv --fullscreen -no-stop-screensaver --loop-file --no-audio --no-osc --no-osd-bar -wid WID --no-input-default-bindings /home/arthur/.local/share/Steam/steamapps/workshop/content/431960/2956215523/moonset.mp4&
else

    xwinwrap -ov -ni -g 1920x1080 -- mpv --fullscreen -no-stop-screensaver --loop-file --no-audio --no-osc --no-osd-bar -wid WID --no-input-default-bindings /home/arthur/.local/share/Steam/steamapps/workshop/content/431960/3047494391/'lullaby of the ocean by visualdon.mp4'&

    xwinwrap -ov -ni -g 3840x2160+1920+0 -- mpv --fullscreen -no-stop-screensaver --loop-file --no-audio --no-osc --no-osd-bar -wid WID --no-input-default-bindings /home/arthur/.local/share/Steam/steamapps/workshop/content/431960/3047494391/'lullaby of the ocean by visualdon.mp4'&
fi
