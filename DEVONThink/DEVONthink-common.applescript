(*
  Common functions shared across DEVONthink AppleScripts
  
  This library contains shared utility functions for:
  - Template path resolution
  - Date calculations and formatting
  - Date input handling
*)

(*
  Template Base Functions	
*)

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
  Date Calculation Functions
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

on get_nearest_thursday(theDate)
	copy theDate to theThursday -- use copy to duplicate the variable, otherwise it's just the reference!
	set twd to weekday of theThursday as number
	if twd is 1 then
		set twd to 8
	end if
	set theThursday to (theThursday + (5 - twd) * 86400)
	return theThursday
end get_nearest_thursday

on create_quarter(theDate)
	set theThursday to get_nearest_thursday(theDate)
	set _month to month of theThursday as number
	set quarter to round ((_month - 1) / 3 + 1) rounding down
	return quarter
end create_quarter

on get_week_number(theDate)
	-- calculate week number for the given thursday
	set theThursday to get_nearest_thursday(theDate)
	-- copy theThursday to yearStart
	set yearStart to year_start(theThursday)
	set theWeekNumber to round (((theThursday - yearStart) / 86400 + 1) / 7) rounding up
	return theWeekNumber
end get_week_number

(*
  Date Formatting Functions
*)

on format00(theNumber)
	return (text -2 thru -1 of ("00" & theNumber))
end format00

on quarter_indicator(theDate)
	set _year to year of theDate as number
	set _quarter to create_quarter(theDate)
	return (_year) & "Q" & (_quarter)
end quarter_indicator

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

(*
  Date Input Functions
*)

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

