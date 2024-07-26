#!/bin/bash

BOUNDS=$1
CSV=`mktemp --suffix .csv`
URLS=`mktemp --suffix .txt`

ogr2ogr -f CSV -select 'TIF_URL' -spat_srs 'EPSG:4326' -spat $1 $CSV data/HAP_Photo_Centres_AGOL.fgb

cat $CSV | sort | uniq | grep 'href' | grep -o 'https:[^"]*' > $URLS

wget --input-file=$URLS --directory-prefix=tif

rm -f $CSV $URLS
