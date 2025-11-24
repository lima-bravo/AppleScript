(*
DEVONthink-task

Create a new task in the current Diary of the database

Based on code from DEVONthink-date


*)

(*

Load common library

*)
(*
set scriptPath to POSIX path of (path to me)
set AppleScript's text item delimiters to "/"
set pathItems to text items of scriptPath
set AppleScript's text item delimiters to "/"
set scriptDir to (items 1 thru -2 of pathItems as string) & "/"
set commonLibPath to POSIX file (scriptDir & "DEVONthink-common.applescript")
*)

set scriptPosixPath to POSIX path of (path to me)
set scriptFolderPosix to do shell script "dirname " & quoted form of scriptPosixPath

set commonLibPath to scriptFolderPosix & "/DEVONthink-common.scpt"
set commonLib to load script (POSIX file commonLibPath)

(*

Actual script starts here

*)


set app_support to (get path to application support from user domain as text)
set template_base to commonLib's get_template_base(app_support)

-- ask the user for the TaskDescription
display dialog "Enter the topic for the task:" default answer ""
set taskDescription to text returned of result
-- set targetDate to current date
set targetDate to current date
-- set targetDate to ui_date_input()
set theThursday to commonLib's get_nearest_thursday(targetDate)
set qt to commonLib's quarter_indicator(theThursday)
set wk to commonLib's week_indicator(theThursday)
set dt to commonLib's day_indicator(targetDate)
set ds to commonLib's day_string(targetDate)
-- now start looking at the DEVONthink application and check the groups
tell application id "DNtp"
	if not (exists current database) then error "No database open"
	tell current database
		try
			set quarterHead to ("/" & qt)
			set quarterLabel to (qt as text)
			set quarterGroup to get record at quarterHead
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
			-- now create the task, replacing TaskDescription with the provided taskDescription
			set _pathName to (app_support & template_base & "Task.rtf")
			set _thePlaceHolders to {|%TaskDescription%|:taskDescription}
			set newRecord to import _pathName placeholders _thePlaceHolders to dayGroup
			set name of newRecord to "Task - " & taskDescription
		on error errMSg
			display dialog "ERROR: " & errMSg
		end try
	end tell
end tell
