#!/bin/bash

. ./bin/ENV.sh

echo START: dupfinder_hist...

java -Xms16m -Xmx256m \
	-Dfile.encoding=UTF-8 \
	-jar ./bin/dupfinder.jar \
	-mongoServer $MNG_SERVER \
	-mongoPort $MNG_PORT \
	-mongoDb $MNG_DB \
	-startupFromDate 20130101 \
	--startupPeriodMins 1440 \
	-startupRedoAll \
	-dupsPeriodMins 720 \
	-liveFreqMins 0 \
	-verbose

if [ "$?" -ne "0" ]; then
  echo "ERROR: dupfinder_hist"
  exit 1
else
  echo "DONE: dupfinder_hist"
  exit 0
fi

