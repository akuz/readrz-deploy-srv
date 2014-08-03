#!/bin/bash

. ./bin/ENV.sh

echo START: pathcalc...

java -Xms256m -Xmx4g \
	-Dfile.encoding=UTF-8 \
	-jar ./bin/pathcalc.jar \
	-mongoServer $MNG_SERVER \
	-mongoPort $MNG_PORT \
	-mongoDb $MNG_DB \
	-stopWordsFile ./bin/stop_words.txt \
	-liveFreqMs 500 \
	-threadCount 6 \
	-logLevel INFO 

if [ "$?" -ne "0" ]; then
  echo "ERROR: pathcalc"

  exit 1
else
  echo "DONE: pathcalc"
  exit 0
fi

