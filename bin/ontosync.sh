#!/bin/bash

. ./bin/ENV.sh

echo START: ontosync...

java -Dfile.encoding=UTF-8 \
	-jar ./bin/ontosync.jar \
	-mongoServer $MNG_SERVER \
	-mongoPort $MNG_PORT \
	-mongoDb $MNG_DB \
	-ontologyDir "ontology"

if [ "$?" -ne "0" ]; then
  echo "ERROR: ontosync"
  exit 1
else
  echo "DONE: ontosync"
  exit 0
fi

