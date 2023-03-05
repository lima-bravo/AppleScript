#@osa-lang:AppleScript
display dialog "Name your note..." default answer ""
set theName to text returned of result

set app_support to (get path to application support from user domain as text)
tell application id "DNtp"
	if not (exists current database) then error "No database open"
	tell current database
		try
			set _pathName to (app_support & "DEVONthink 3:Templates.noindex:@LB.dtTemplate:English.lproj:zettelkasten-newnote.md")
			set _thePlaceHolders to {|%title%|:theName}
			set newRecord to import _pathName placeholders _thePlaceHolders to current group
			set name of newRecord to theName
		on error errMSg
			display dialog "ERROR: " & errMSg
		end try
	end tell
end tell
