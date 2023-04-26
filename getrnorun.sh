#!/bin/sh
if [ $# -eq 1 ] && [ "$1" = "-h" ]
  then
    echo "first argument should be the station number,"
    echo "the second one the run number"
    exit 0
fi
if [ $# -eq 2 ]
	then
STATION="$1"
RUN="$2"

cd RNO_DATA_DIR
mkdir station$STATION
cd station$STATION
mkdir run$RUN
cd run$RUN

curl https://rnog-data-protected.zeuthen.desy.de/inbox/station"$STATION"/run"$RUN"/combined.root -H "Authorization: Bearer `oidc-token radio`" --output combined.root
cd
exit 0

fi

echo "incorrect use"
exit 1
