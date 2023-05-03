#!/bin/sh

# all unpack
#
if [ $# -eq 1 ] && [ "$1" = "-h" ]
  then
    echo "give as a first argument the file you want to unpack"
    echo "unpacks .zip, .tar.gz and .gz files"
    exit 0
fi
if [ $# -eq 1 ]
then
	BASEFILE=$(basename "$1")
	FILE=$(echo $BASEFILE | sed 's/ //g')

	if [ "$BASEFILE" != "$FILE" ]
	then
		mv "$BASEFILE" "$FILE"
	fi

	if [ "$FILE" = *".zip" ]
	then
		unzip $FILE
		exit 0
	fi
	if [ "$FILE" = *".tar.gz" ]
	then
		tar -xvzf $FILE
		exit 0
	fi
	if [ "$FILE" = *".gz" ]
	then
		gunzip $FILE
		exit 0
	fi
fi
echo "incorrect use"
exit 1

