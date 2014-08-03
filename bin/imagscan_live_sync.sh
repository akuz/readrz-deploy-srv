#!/bin/bash

. ./bin/ENV.sh

echo START: imagscan_live...

java -Xms16m -Xmx512m \
	-Dfile.encoding=UTF-8 \
	-jar ./bin/imagscan.jar \
	-mongoServer $MNG_SERVER \
	-mongoPort $MNG_PORT \
	-mongoDb $MNG_DB \
	-blockedUrlsFile ./bin/image_blocked_urls.txt \
	-stopWordsFile ./bin/stop_words.txt \
	-startupPeriodMins 1440 \
	----startupRedoAll \
	-liveFreqMins 1 \
	-livePeriodMins 1440 \
	-threadCount 10 \
	-logLevel INFO \

if [ "$?" -ne "0" ]; then
  echo "ERROR: imagscan_live"
  exit 1
else
  echo "DONE: imagscan_live"
  exit 0
fi

