(*
  Create a diary entry with weekly and daily focus, order in quarters and weeks, based on date provided in the dialog.

	Using input from:
  	- https://macscripter.net/viewtopic.php?id=24737
	- https://discourse.devontechnologies.com/t/read-only-file-system-error-when-calling-shell-script-within-applescript/73923/8
	- https://discourse.devontechnologies.com/t/applescript-access-denied-issues-with-import-to/73673
 *)

(*

Load common library

*)

set scriptPosixPath to POSIX path of (path to me)
set scriptFolderPosix to do shell script "dirname " & quoted form of scriptPosixPath

set commonLibPath to scriptFolderPosix & "/DEVONthink-common.scpt"
set commonLib to load script (POSIX file commonLibPath)


(*

Actual script starts here

*)

-- log "Starting "
set app_support to (get path to application support from user domain as text)
set template_base to commonLib's get_template_base(app_support)
-- set targetDate to current date
-- here ask the user for the desired date
set targetDate to commonLib's get_date_input()
-- log "targetDate: " & (targetDate as string)

-- set targetDate to ui_date_input()
set theThursday to commonLib's get_nearest_thursday(targetDate)
set qt to commonLib's quarter_indicator(theThursday)
set wk to commonLib's week_indicator(theThursday)
set dt to commonLib's day_indicator(targetDate)
set ds to commonLib's day_string(targetDate)
-- log "Logging " & " " & qt & " " & wk & " " & dt & " " & ds
-- now start looking at the DEVONthink application and check the groups
tell application id "DNtp"
	if not (exists current database) then error "No database open"
	(*
	tell current database
		log "Database name: " & name
		log "Database path: " & path
		log "Database UUID: " & uuid
	end tell
	*)
	tell current database
		try
			set quarterHead to ("/" & qt)
			set quarterLabel to (qt as text)
			set quarterGroup to get record at quarterHead
			-- log "QuarterGroup " & name of quarterGroup
			if quarterGroup is missing value or (type of quarterGroup is not group) then
				-- the rootGroup does not exist, go and create it
				set quarterGroup to create location quarterLabel
				set _pathName to (app_support & template_base & "Quarterly Results.rtf")
				-- set quarterGroup to create record with {name:quarterLabel, type:group} in quarterGroup
				set _thePlaceHolders to {|YYYYQ|:quarterLabel}
				set newRecord to import _pathName placeholders _thePlaceHolders to quarterGroup
				set name of newRecord to "Quarterly Results - " & quarterLabel
				
			end if
			-- now we have the quarter for sure, create the week group
			set weekLabel to (wk as text)
			set target to (quarterLabel & "/" & weekLabel)
			set weekGroup to get record at (target)
			-- log "weekGroup " & name of weekGroup
			if weekGroup is missing value or (type of weekGroup is not group) then
				set _pathName to (app_support & template_base & "Weekly Results.rtf")
				set weekGroup to create record with {name:weekLabel, type:group} in quarterGroup
				set _thePlaceHolders to {|YYYYW|:weekLabel}
				set newRecord to import _pathName placeholders _thePlaceHolders to weekGroup
				set name of newRecord to "Weekly Results - " & weekLabel
			end if
			-- now create the target record if it does not exist
			set dayLabel to (dt as text)
			set target to (quarterLabel & "/" & weekLabel & "/" & dayLabel)
			set dayGroup to get record at (target)
			if dayGroup is missing value or (type of dayGroup is not group) then
				set dayString to (ds as text)
				set _pathName to (app_support & template_base & "Daily Results.rtf")
				set dayGroup to create record with {name:dayLabel, type:group} in weekGroup
				set _thePlaceHolders to {|YYYY-MM-DD|:dayString}
				set newRecord to import _pathName placeholders _thePlaceHolders to dayGroup
				set name of newRecord to "Daily Results - " & dayString
			end if
		on error errMSg
			display dialog "ERROR: " & errMSg
		end try
	end tell
end tell
