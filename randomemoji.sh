
#!/bin/sh

# Get a random emoji xdxp

chosen=$(cut -d ';' -f1 /home/arthur/Scripts/emojis/* | shuf -n 1 | sed "s/ .*//" )

# Exit if none chosen.
[ -z "$chosen" ] && exit

# If you run this command with an argument, it will automatically insert the
# character. Otherwise, show a message that the emoji has been copied.
if [ -n "$1" ]; then
	xdotool type "$chosen"
else
	printf "$chosen" | xclip -selection clipboard
	notify-send "'$chosen' copied to clipboard." &
fi
