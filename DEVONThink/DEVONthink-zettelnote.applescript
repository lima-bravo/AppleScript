(*
  Create a new zettelkasten note in DEVONthink
*)

(*
  Load common library
*)

set scriptPath to POSIX path of (path to me)
set AppleScript's text item delimiters to "/"
set pathItems to text items of scriptPath
set AppleScript's text item delimiters to "/"
set scriptDir to (items 1 thru -2 of pathItems as string) & "/"
set commonLibPath to POSIX file (scriptDir & "DEVONthink-common.applescript")
set commonLib to load script commonLibPath

(*

Actual script starts here

*)

set app_support to (get path to application support from user domain as text)
set template_base to commonLib's get_template_base(app_support)

display dialog ("Name your note...[" & template_base & "]") default answer ""
set theName to text returned of result


tell application id "DNtp"
	if not (exists current database) then error "No database open"
	tell current database
		try
			set _pathName to (app_support & template_base & "zettelkasten-newnote.md")
			set _thePlaceHolders to {|%title%|:theName}
			set newRecord to import _pathName placeholders _thePlaceHolders to current group
			set name of newRecord to theName
		on error errMSg
			display dialog "ERROR: " & errMSg
		end try
	end tell
end tell
