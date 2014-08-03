#!/bin/bash

. ./bin/ENV.sh

echo START: summr...

java -Xms256m -Xmx4g \
	-Dfile.encoding=UTF-8 \
	-jar ./bin/summr.jar \
	-mongoServer $MNG_SERVER \
	-mongoPort $MNG_PORT \
	-mongoDb $MNG_DB \
	-stopWordsFile ./bin/stop_words.txt \
	-liveFreqMs 500 \
	-threadCount 10 \
	-logLevel FINE 

if [ "$?" -ne "0" ]; then
  echo "ERROR: summr"

  exit 1
else
  echo "DONE: summr"
  exit 0
fi

