#!/bin/bash
#
# install the script files in the DEVONthink scripts directory
#
# this must be run from this directory
#
# Using @LB as a way of getting it at the top of the Scripts hierarchy - otherwise use @$USER or something
#
TARGET="${HOME}/Library/Application Scripts/com.devon-technologies.think3/Menu/@LB"
if [[ ! -d "${TARGET}" ]]; then
	mkdir -p "$TARGET"
fi
for f in *.scpt; do
	cp $f "${TARGET}/"
done	
