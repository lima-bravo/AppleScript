#!/bin/bash
#
# install the script files in the DEVONthink scripts directory
#
# this must be run from this directory
#
TARGET="${HOME}/Library/Application Scripts/com.devon-technologies.think3/Menu/@LB"
if [[ ! -d "${TARGET}" ]]; then
	mkdir -p "$TARGET"
fi
for f in *.scpt; do
	cp $f "${TARGET}/"
done	
