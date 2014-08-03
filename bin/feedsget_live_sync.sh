#!/bin/bash

. ./bin/ENV.sh

echo START: feedsget_live...

java -Dfile.encoding=UTF-8 \
	-jar ./bin/feedsget.jar \
	-mongoServer $MNG_SERVER \
	-mongoPort $MNG_PORT \
	-mongoDb $MNG_DB \
	--------verbose \
	-threadCount 10 \

if [ "$?" -ne "0" ]; then
  echo "ERROR: feedsget_live"
  exit 1
else
  echo "DONE: feedsget_live"
  exit 0
fi

