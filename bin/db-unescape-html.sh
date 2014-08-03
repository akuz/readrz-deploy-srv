#!/bin/bash

. ./bin/ENV.sh

echo START: db-unescape-html...

java -Xms128m -Xmx512m \
	-Dfile.encoding=UTF-8 \
	-jar ./bin/db-unescape-html.jar \
	-mongoServer $MNG_SERVER \
	-mongoPort $MNG_PORT \
	-mongoDb $MNG_DB \

if [ "$?" -ne "0" ]; then
  echo "ERROR: db-unescape-html"
  exit 1
else
  echo "DONE: db-unescape-html"
  exit 0
fi

