(*
  Create a new zettelkasten note in DEVONthink
*)

(*

Load common library

*)

set scriptPosixPath to POSIX path of (path to me)
set scriptFolderPosix to do shell script "dirname " & quoted form of scriptPosixPath

set commonLibPath to scriptFolderPosix & "/.DEVONthink-common.scpt"
set commonLib to load script (POSIX file commonLibPath)


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
