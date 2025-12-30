#!/bin/bash
#
# install the script files in the DEVONthink scripts directory
#
# this must be run from this directory
#
# Using @LB as a way of getting it at the top of the Scripts hierarchy - otherwise use @$USER or something
#
# Install the scripts

SCRIPTS_LIST=".DEVONthink-common DEVONthink-date DEVONthink-task DEVONthink-zettelnote"

process_scripts() {
	for script in ${SCRIPTS_LIST}; do
		echo "Processing $script"
		compile_script "$script.applescript"
		make_copy "${TARGET}" "$script.scpt"
		rm "$script.scpt"
	done
}

makedir() {
	# must be called with parenthesis to accomodate space and special characters
	TARGET=${1}
	if [[ ! -d "${TARGET}" ]]; then
		mkdir -p "$TARGET"
	fi
}

make_copy() {
	TARGET="${1}"
	f="$1"
	echo "Copying $f to ${TARGET}"
	cp "$f" "${TARGET}/"
}


docopy() {
	TARGET="${1}"
	FILTER="${2}"
	for f in $FILTER; do
		echo "Copying $f to ${TARGET}"
		cp "$f" "${TARGET}/"
	done 
}


compile_script() {
	# Compile all .applescript files to .scpt files
	f="$1"
	if [[ -f "$f" ]]; then
		BASENAME="${f%.applescript}"
		SCPTFILE="${BASENAME}.scpt"
		echo "Compiling $f to ${SCPTFILE}"
		osacompile -o "${SCPTFILE}" "$f"
		if [[ $? -ne 0 ]]; then
			echo "ERROR: Failed to compile $f"
			exit 1
		fi
	fi
}



# Install the scripts
if [[ -d "${HOME}/Library/Application Scripts/com.devon-technologies.think3/Menu" ]]; then
	# DEVONthink 3
	TARGET="${HOME}/Library/Application Scripts/com.devon-technologies.think3/Menu/@LB"
elif [[ -d "${HOME}/Library/Application Scripts/com.devon-technologies.think/Menu" ]]; then
	# DEVONthink 4
	TARGET="${HOME}/Library/Application Scripts/com.devon-technologies.think/Menu/@LB"
else
	echo "No DEVONthink installation found"
	exit 1
fi

# Compile the AppleScript source files and place them in the target directory
process_scripts

#
# Next, install the templates
if [[ -d "${HOME}/Library/Application Support/DEVONthink 3/Templates.noindex" ]]; then
	# DEVONthink 3
	TARGET="${HOME}/Library/Application Support/DEVONthink 3/Templates.noindex/@LB.dtTemplate/English.lproj"
elif [[ -d "${HOME}/Library/Application Support/DEVONthink/Templates.noindex" ]]; then
	# DEVONthink 4
	TARGET="${HOME}/Library/Application Support/DEVONthink/Templates.noindex/@LB.dtTemplate/English.lproj"
else
	echo "No DEVONthink templates installation found"
	exit 1
fi
#
makedir "${TARGET}"
docopy "${TARGET}" "templates/*"
