#!/bin/bash

. ./bin/ENV.sh

echo START: topicalc_hist...

java -Xms512m -Xmx16g \
	-Dfile.encoding=UTF-8 \
	-jar ./bin/topicalc.jar \
	-mongoServer $MNG_SERVER \
	-mongoPort $MNG_PORT \
	-mongoDb $MNG_DB \
	-outputDir topics/hist3m \
	-stopWordsFile bin/stop_words.txt \
	-burnInStepCount 10 \
	-burnInStepIterations 5 \
	-sampleTemperature 0.1 \
	-sampleCount 100 \
	-sampleGap 0 \
	-outWordCount 500 \
	-threadCount 8 \
	-daysCount 90 \

if [ "$?" -ne "0" ]; then
  echo "ERROR: topicalc_hist"
  exit 1
else
  echo "DONE: topicalc_hist"
  exit 0
fi

