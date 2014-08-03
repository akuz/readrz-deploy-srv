#!/bin/bash

. ./bin/ENV.sh

echo START: db-ensure-idx...

java -Dfile.encoding=UTF-8 \
	-jar ./bin/db-ensure-idx.jar \
	-mongoServer $MNG_SERVER \
	-mongoPort $MNG_PORT \
	-mongoDb $MNG_DB \

if [ "$?" -ne "0" ]; then
  echo "ERROR: db-ensure-idx"
  exit 1
else
  echo "DONE: db-ensure-idx"
  exit 0
fi

