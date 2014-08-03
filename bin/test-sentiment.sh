#!/bin/bash

. ./bin/ENV.sh

echo START: test-sentiment..

java -Xms16m -Xmx256m \
	-Dfile.encoding=UTF-8 \
	-jar ./bin/test-sentiment.jar \
        -mongoServer $MNG_SERVER \
        -mongoPort $MNG_PORT \
        -mongoDb $MNG_DB \
	-minDateInc 20131201 \
	-maxDateExc 20131223 \
	-frequency Hourly \
	-wordsSentimentFile "./bin/words_sent.csv" \
	-outputFile "./sentiment/sentiment_us.csv" \
	-queryString "US*" \

if [ "$?" -ne "0" ]; then
  echo "ERROR: test-sentiment"
  exit 1
else
  echo "DONE: test-sentiment"
  exit 0
fi

