#!/bin/bash
date
#gpsdata=$( gpspipe -w -n 10 |   grep -m 1 lon )
gpsdata=$( gpspipe -w | grep -m 1 TPV )
lat=$( echo "$gpsdata"  | awk 'return this.lat' )
lon=$( echo "$gpsdata"  | awk 'return this.lon' )
alt=$( echo "$gpsdata"  | awk 'return this.alt' )
dt=$( echo "$gpsdata" | awk 'return this.time' )
echo "$dt"
echo "You are here: $lat, $lon at $alt"
