#!/bin/sh

xdotool type $(grep -v '^#' /home/arthur/Scripts/bookmarks.txt | dmenu -i -l 20 | cut -d ' ' -f1)
