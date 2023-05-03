#!/bin/sh

# all unpack
#
if [ $# -eq 1 ] && [ "$1" = "-h" ]
  then
    echo ""
    exit 0
fi
if [ $# -eq 1 ]
then
	FILE="$(basename "$1")"
	if [ "$FILE" = *".zip" ]
	then
		unzip $FILE
		rm $FILE
		exit 0
	fi
	if [ "$FILE" = *".tar.gz" ]
	then
		tar -xvzf $FILE
		rm $FILE
		exit 0
	fi
	if [ "$FILE" = *".gz" ]
	then
		gunzip $FILE
		rm $FILE
		exit 0
	fi
fi
echo "incorrect use"
exit 1
