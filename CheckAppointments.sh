#!/bin/sh

CONT="$(calcurse -n)"
if [ -z "$CONT" ]
then
	echo "Geen afspraken vandaag"
else
	notify-send -i /home/arthur/Scripts/extra/CalIcon.svg "$CONT"
fi
