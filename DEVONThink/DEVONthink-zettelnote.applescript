o
on get_template_base(app_support)
	set lb_path to "Templates.noindex:@LB.dtTemplate:English.lproj:"
	-- set dt3_path to (app_support & "DEVONthink 3:" & lb_path) as string
	try
		-- alias dt3_path
		return "DEVONthink 3:" & lb_path
	on error
		return "DEVONthink:" & lb_path
	end try
end get_template_base

(*

Actual script starts here

*)

set app_support to (get path to application support from user domain as text)
set template_base to get_template_base(app_support)

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
