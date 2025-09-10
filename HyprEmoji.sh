
#!/bin/sh

# get a menu of emojis to copy script, stolen from lukesmith.

# Get user selection via dmenu from emoji file.
chosen=$(cut -d ';' -f1 /home/arthur/Scripts/emojis/* | wofi -d -i -l 30 | sed "s/ .*//")

# Exit if none chosen.
[ -z "$chosen" ] && exit

# If you run this command with an argument, it will automatically insert the
# character. Otherwise, show a message that the emoji has been copied.
if [ -n "$1" ]; then
	ydotool type "$chosen"
else
	printf "$chosen" | wl-copy 
    hyprctl notify -2 10000 "rgb(ff0000)" "'$chosen' copied to clipboard." &
fi
