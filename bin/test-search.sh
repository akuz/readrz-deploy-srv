#!/bin/bash

. ./bin/ENV.sh

echo START: test-search...

java -Xms16m -Xmx256m \
	-Dfile.encoding=UTF-8 \
	-jar ./bin/test-search.jar \
	-q "$*" 

if [ "$?" -ne "0" ]; then
  echo "ERROR: test-search"
  exit 1
else
  echo "DONE: test-search"
  exit 0
fi

