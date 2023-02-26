#/bin/sh

groff -e -t -ms -U -Kutf8 $1 -T pdf > $2
