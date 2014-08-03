#!/bin/bash

. ./bin/ENV.sh

echo START: indexer_live...

java -Xms64m -Xmx400m \
	-Dfile.encoding=UTF-8 \
	-jar ./bin/indexer.jar \
	-mongoServer $MNG_SERVER \
	-mongoPort $MNG_PORT \
	-mongoDb $MNG_DB \
	-startupPeriodMins 2880 \
	--startupRedoAll \
	-liveFreqMins 1 \
	-livePeriodMins 1440 \
	-logLevel FINE

if [ "$?" -ne "0" ]; then
  echo "ERROR: indexer_live"
  exit 1
else
  echo "DONE: indexer_live"
  exit 0
fi

