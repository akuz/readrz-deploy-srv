#!/bin/bash

. ./bin/ENV.sh

echo START: indexer_hist...

java -Xms128m -Xmx1g \
	-Dfile.encoding=UTF-8 \
	-jar ./bin/indexer.jar \
	-mongoServer $MNG_SERVER \
	-mongoPort $MNG_PORT \
	-mongoDb $MNG_DB \
	--startupPeriodMins 10080 \
	-startupFromDate 20130101 \
	-startupRedoAll \
	-liveFreqMins 0 \
	-verbose

if [ "$?" -ne "0" ]; then
  echo "ERROR: indexer_hist"
  exit 1
else
  echo "DONE: indexer_hist"
  exit 0
fi

