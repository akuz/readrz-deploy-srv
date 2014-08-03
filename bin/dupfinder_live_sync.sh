#!/bin/bash

. ./bin/ENV.sh

echo START: dupfinder_live...

java -Xms16m -Xmx256m \
	-Dfile.encoding=UTF-8 \
	-jar ./bin/dupfinder.jar \
	-mongoServer $MNG_SERVER \
	-mongoPort $MNG_PORT \
	-mongoDb $MNG_DB \
	-startupPeriodMins 2880 \
	-------startupRedoAll \
	-dupsPeriodMins 720 \
	-liveFreqMins 1 \
	-livePeriodMins 1440 \
	-verbose

if [ "$?" -ne "0" ]; then
  echo "ERROR: dupfinder_live"
  exit 1
else
  echo "DONE: dupfinder_live"
  exit 0
fi

