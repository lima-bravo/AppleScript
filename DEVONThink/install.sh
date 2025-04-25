#!/bin/bash
#
# install the script files in the DEVONthink scripts directory
#
# this must be run from this directory
#
# Using @LB as a way of getting it at the top of the Scripts hierarchy - otherwise use @$USER or something
#
# Install the scripts

makedir() {
	# must be called with parenthesis to accomodate space and special characters
	TARGET=${1}
	if [[ ! -d "${TARGET}" ]]; then
		mkdir -p "$TARGET"
	fi
}

docopy() {
	TARGET="${1}"
	FILTER="${2}"
	for f in $FILTER; do
		echo "Copying $f to ${TARGET}"
		cp "$f" "${TARGET}/"
	done 
}

# Install the scripts
TARGET="${HOME}/Library/Application Scripts/com.devon-technologies.think/Menu/@LB"
makedir "${TARGET}"
docopy "${TARGET}" "*.scpt"
# Install the templates
TARGET="${HOME}/Library/Application Support/DEVONthink/Templates.noindex/@LB.dtTemplate/English.lproj"
makedir "${TARGET}"
docopy "${TARGET}" "templates/*"


