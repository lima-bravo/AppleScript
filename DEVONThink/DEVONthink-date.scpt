#@osa-lang:AppleScript
(*
  Create a diary entry with weekly and daily focus, order in quarters and weeks, based on date provided in the dialog.

	Using input from:
  	- https://macscripter.net/viewtopic.php?id=24737
	- https://discourse.devontechnologies.com/t/read-only-file-system-error-when-calling-shell-script-within-applescript/73923/8
	- https://discourse.devontechnologies.com/t/applescript-access-denied-issues-with-import-to/73673
 *)
(*
-- redundant code
 --needed for ui_get_date
use scripting additions
use framework "Foundation"
use framework "AppKit"
*)
(*

Subroutine Block

*)

on year_start(theDate)
	copy theDate to yearStart
	set yearStart's month to January
	set yearStart's day to 1
	set yearStart's hours to 0
	set yearStart's minutes to 0
	set yearStart's seconds to 0
	return yearStart
end year_start

on create_quarter(theDate)
	set theThursday to get_nearest_thursday(theDate)
	set _month to month of theThursday as number
	set quarter to round ((_month - 1) / 3 + 1) rounding down
	return quarter
end create_quarter

on get_nearest_thursday(theDate)
	copy theDate to theThursday -- use copy to duplicate the variable, otherwise it's just the reference!
	set twd to weekday of theThursday as number
	if twd is 1 then
		set twd to 8
	end if
	set theThursday to (theThursday + (5 - twd) * 86400)
	return theThursday
end get_nearest_thursday

on get_week_number(theDate)
	-- calculate week number for the given thursday
	set theThursday to get_nearest_thursday(theDate)
	-- copy theThursday to yearStart
	set yearStart to year_start(theThursday)
	set theWeekNumber to round (((theThursday - yearStart) / 86400 + 1) / 7) rounding up
	return theWeekNumber
end get_week_number

on quarter_indicator(theDate)
	set _year to year of theDate as number
	set _quarter to create_quarter(theDate)
	return (_year) & "Q" & (_quarter)
end quarter_indicator

on format00(theNumber)
	return (text -2 thru -1 of ("00" & theNumber))
end format00

on week_indicator(theDate)
	set _year to year of theDate
	set _week to get_week_number(theDate)
	return (_year) & "W" & format00(_week) -- create a string with the leading zeros
end week_indicator

on day_formatter(theDate, _sep)
	set _year to year of theDate
	set _month to month of theDate as number
	set _day to day of theDate as number

	set _ms to format00(_month)
	set _ds to format00(_day)
	return ((_year) & _sep & (_ms) & _sep & (_ds))
end day_formatter

on day_indicator(theDate)
	return day_formatter(theDate, "")
end day_indicator

on day_string(theDate)
	return day_formatter(theDate, "-")
end day_string


on get_date_input()
	set todaysDate to current date

	set _todayDay to day of todaysDate as number
	set _todayMonth to month of todaysDate as number
	set _todayYear to year of todaysDate as number

	set _todayString to ((_todayYear as string) & "-" & (_todayMonth as string) & "-" & (_todayDay as string))

	display dialog "What is the target date?" & return & return & "format YYYY-MM-DD" & return default answer _todayString with title "Target date"
	set dueDate to (the text returned of the result)

	set taskDueDate to todaysDate
	set the year of taskDueDate to word 1 of dueDate
	set the month of taskDueDate to word 2 of dueDate
	set the day of taskDueDate to word 3 of dueDate

	return taskDueDate
end get_date_input

(*

Actual script starts here

*)


set app_support to (get path to application support from user domain as text)
-- set targetDate to current date
-- here ask the user for the desired date
set targetDate to get_date_input()
-- set targetDate to ui_date_input()
set theThursday to get_nearest_thursday(targetDate)
set qt to quarter_indicator(theThursday)
set wk to week_indicator(theThursday)
set dt to day_indicator(targetDate)
set ds to day_string(targetDate)
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
				set _pathName to (app_support & "DEVONthink 3:Templates.noindex:@LB.dtTemplate:English.lproj:Quarterly Results.rtf")
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
				set _pathName to (app_support & "DEVONthink 3:Templates.noindex:@LB.dtTemplate:English.lproj:Weekly Results.rtf")
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
				set _pathName to (app_support & "DEVONthink 3:Templates.noindex:@LB.dtTemplate:English.lproj:Daily Results.rtf")
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
