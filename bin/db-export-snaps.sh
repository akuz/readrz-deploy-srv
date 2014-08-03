#!/bin/bash

. ./bin/ENV.sh

echo START: db-export-snaps...

java -Dfile.encoding=UTF-8 \
	-jar ./bin/db-export-snaps.jar \
	-mongoServer $MNG_SERVER \
	-mongoPort $MNG_PORT \
	-mongoDb $MNG_DB \
	-fromDate 20130101 \
	-outputDir ./out_snaps \
	-maxSnaps 50000 \

if [ "$?" -ne "0" ]; then
  echo "ERROR: db-export-snaps"
  exit 1
else
  echo "DONE: db-export-snaps"
  exit 0
fi

