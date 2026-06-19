#!/usr/bin/env bash
#
# install the script files in the DEVONthink scripts directory
#
# Run from any directory: ./install.sh
# Do not source this script (. ./install.sh); it must run under bash.
#
# Using @LB as a way of getting it at the top of the Scripts hierarchy - otherwise use @$USER or something
#

if [[ -z "${BASH_VERSION:-}" ]]; then
	exec bash "$0" "$@"
fi

if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
	echo "ERROR: Do not source this script. Run: ./install.sh" >&2
	return 1 2>/dev/null || exit 1
fi

set -euo pipefail

cd "$(dirname "$0")"

SCRIPTS=(
	".DEVONthink-common"
	"DEVONthink-date"
	"DEVONthink-task"
	"DEVONthink-zettelnote"
)

process_scripts() {
	local script
	for script in "${SCRIPTS[@]}"; do
		echo "Processing $script"
		compile_script "${script}.applescript"
		make_copy "${TARGET}" "${script}.scpt"
		rm "${script}.scpt"
	done
}

makedir() {
	# must be called with parenthesis to accomodate space and special characters
	local target="${1}"
	# check if the target directory exists, and empty it
	if [[ -d "${target}" ]]; then
		rm -rf "${target}"
	fi
	# create the target directory
	mkdir -p "${target}"
}

make_copy() {
	local target="${1}"
	local f="${2}"
	echo "Copying ${f} to ${target}"
	cp "${f}" "${target}/"
}

docopy() {
	local target="${1}"
	local pattern="${2}"
	local f
	shopt -s nullglob
	local files=(${pattern})
	shopt -u nullglob
	if [[ ${#files[@]} -eq 0 ]]; then
		echo "ERROR: No files match ${pattern}" >&2
		exit 1
	fi
	for f in "${files[@]}"; do
		echo "Copying ${f} to ${target}"
		cp "${f}" "${target}/"
	done
}

directory_copy() {
	local target="${1}"
	local pattern="${2}"
	local f
	shopt -s nullglob
	local files=(${pattern})
	shopt -u nullglob
	if [[ ${#files[@]} -eq 0 ]]; then
		echo "ERROR: No files match ${pattern}" >&2
		exit 1
	fi
	for f in "${files[@]}"; do
		echo "Copying ${f} to ${target}"
		cp -r "${f}" "${target}/"
	done
}

compile_script() {
	# Compile all .applescript files to .scpt files
	local f="${1}"
	if [[ ! -f "${f}" ]]; then
		echo "ERROR: Source file not found: ${f}" >&2
		exit 1
	fi
	local basename="${f%.applescript}"
	local scptfile="${basename}.scpt"
	echo "Compiling ${f} to ${scptfile}"
	osacompile -o "${scptfile}" "${f}"
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

# now create the target directory
makedir "${TARGET}"

# Compile the AppleScript source files and place them in the target directory
process_scripts

#
# Next, install the templates
#
if [[ -d "${HOME}/Library/Application Support/DEVONthink/Templates.noindex" ]]; then
	# DEVONthink 4
	TARGET="${HOME}/Library/Application Support/DEVONthink/Templates.noindex/@LB.dtTemplate/English.lproj"
elif [[ -d "${HOME}/Library/Application Support/DEVONthink 3/Templates.noindex" ]]; then
	# DEVONthink 3
	TARGET="${HOME}/Library/Application Support/DEVONthink 3/Templates.noindex/@LB.dtTemplate/English.lproj"
else
	echo "No DEVONthink templates installation found"
	exit 1
fi
#
makedir "${TARGET}"
docopy "${TARGET}" "templates/*"

# Next, install the File templates
if [[ -d "${HOME}/Library/Application Support/DEVONthink/Templates.noindex" ]]; then
	# DEVONthink 4
	TARGET="${HOME}/Library/Application Support/DEVONthink/Templates.noindex/Common Templates"
elif [[ -d "${HOME}/Library/Application Support/DEVONthink 3/Templates.noindex" ]]; then
	# DEVONthink 3
	TARGET="${HOME}/Library/Application Support/DEVONthink 3/Templates.noindex/Common Templates"
else
	echo "No DEVONthink file templates installation found "
	exit 1
fi
makedir "${TARGET}"
directory_copy "${TARGET}" "Common/*"

echo "Install complete."
