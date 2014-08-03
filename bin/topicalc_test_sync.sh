#!/bin/bash

. ./bin/ENV.sh

echo START: topicalc_test...

java -Xms256m -Xmx8g \
	-Dfile.encoding=UTF-8 \
	-jar ./bin/topicalc.jar \
	-mongoServer $MNG_SERVER \
	-mongoPort $MNG_PORT \
	-mongoDb $MNG_DB \
	-outputDir topics/test \
	-stopWordsFile bin/stop_words.txt \
	-burnInStepCount 5 \
	-burnInStepIterations 5 \
	-sampleTemperature 0.1 \
	-sampleCount 10 \
	-sampleGap 0 \
	-outWordCount 100 \
	-threadCount 2 \
	-daysCount 3 \

if [ "$?" -ne "0" ]; then
  echo "ERROR: topicalc_test"
  exit 1
else
  echo "DONE: topicalc_test"
  exit 0
fi

