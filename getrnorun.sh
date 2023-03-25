#!/bin/sh

STATION="$1"
RUN="$2"
PREFIX=~/mnt/usb/RNO-G-DATA

cd $PREFIX
mkdir station$STATION
cd station$STATION
mkdir run$RUN
cd run$RUN

curl https://rnog-data-protected.zeuthen.desy.de/inbox/station"$STATION"/run"$RUN"/combined.root -H "Authorization: Bearer `oidc-token radio`" --output combined.root

cd