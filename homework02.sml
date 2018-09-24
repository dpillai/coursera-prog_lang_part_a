(* Assignment 1 : Question 1 *)
fun is_older (date1 : int*int*int, date2 : int*int*int)=
    if #1 date1 < #1 date2
    then true
    else if #1 date1 = #1 date2 andalso #2 date1 < #2 date2
    then true
    else if #1 date1 = #1 date2 andalso #2 date1 = #2 date2 andalso #3 date1 < #3 date2
    then true
    else false
	     
(* Assignment 1 : Question 2 *)
fun number_in_month (dates : (int*int*int) list, key : int)=
    if null dates
    then 0
    else if (#2 (hd dates) = key)
    then 1 + number_in_month(tl dates, key)
    else number_in_month(tl dates, key)

(* Assignment 1 : Question 3 *)
fun number_in_months (dates : (int*int*int) list, mnths : int list)=
    if null mnths
    then 0
    else number_in_month(dates, hd mnths) + number_in_months(dates, tl mnths)

(* Assignment 1 : Question 4 *)
fun dates_in_month (dates : (int*int*int) list, key : int)=
    if null dates
    then []
    else if (#2 (hd dates) = key)
    then hd dates :: dates_in_month(tl dates, key)
    else dates_in_month(tl dates, key)

(* Assignment 1 : Question 5 *)
fun dates_in_months (dates : (int*int*int) list, mnths : int list)=
    if null mnths
    then []
    else dates_in_month(dates, hd mnths) @ dates_in_months(dates, tl mnths)

(* Assignment 1 : Question 6 *)
fun get_nth (strs : string list, n : int)=
    if null strs
    then ""
    else let val ctr = 1
	 in if ctr = n
	    then hd strs
	    else get_nth(tl strs, n-1)
	 end

(* Assignment 1 : Question 7 *)
fun date_to_string (year : int, month : int, date : int)=
    let
	val mnths = ["January","February","March","April",
		     "May","June","July","August",
		     "September","October","November","December"]
    in
	get_nth (mnths, (month)) ^" " ^  Int.toString date ^ ", " ^ Int.toString year
    end

(* Assignment 1 : Question 8 *)	
fun number_before_reaching_sum (sum : int, nums : int list) =
    if null nums orelse  null (tl nums)
    then 0
    else
	let val nth = 1
	in
	    if sum <= hd nums + hd (tl nums)
	    then nth
	    else nth + number_before_reaching_sum ((sum - hd nums), tl nums)
	end

(* Assignment 1 : Question 9 *)
fun what_month (day : int)=
    let val days =[31,28,31,30,31,30,31,31,30,31,30,31]
    in
	if (day <= 31)
	then 1
	else
	    1+ number_before_reaching_sum (day, days)
    end

(* Assignment 1 : Question 10 *)
fun month_range (day1 : int, day2 : int)=
 	if (day1> day2)
	then []
	else
	    let fun mnth_list(next : int)=
		    if next < day2
		    then
			[what_month(next)] @ mnth_list(next +1)
		    else
			[what_month(next)]
	    in
		mnth_list(day1)
	    end

(* Assignment 1 : Question 11 *)
fun oldest (dates : (int*int*int) list)=
    if null dates
    then NONE
    else
	let fun old (curr : (int*int*int), rem_dates : (int*int*int) list)=
		if null (tl rem_dates)
		then curr
		else if is_older (curr, hd  rem_dates)
		then old (curr, tl rem_dates)
		else old (hd rem_dates, tl rem_dates)
	in
	    SOME (old (hd dates, dates))
	end

(* Assignment 1 : Question 12 *)
fun in_list (seed : int, tgt : int list)=
    if null tgt
    then false
    else if seed = hd tgt
    then true
    else in_list(seed, tl tgt)

fun rem_duplicates (dups : int list)=
    if null dups
    then []
    else
	if null (tl dups)
	then dups
	else if in_list(hd dups, tl dups)
	then rem_duplicates (tl dups)
	else hd dups :: rem_duplicates (tl dups)
				       
fun number_in_months_challenge (dates : (int*int*int) list, months : int list) =
    number_in_months(dates, rem_duplicates(months))    

fun dates_in_months_challenge (dates : (int*int*int) list, months : int list) =
    dates_in_months(dates, rem_duplicates(months))

(* Assignment 1 : Question 13 *)
fun is_leap(year : int)=
    (year mod 100) <> 0 andalso (((year mod 4) = 0) orelse ((year mod 400) = 0));
	     
fun valid_month (month : int)=
    month > 0 andalso month <=12;

fun get_day_cap (isLeap : bool, mnth : int, mnthDays : (int*int) list)=
    if null mnthDays
    then 0
    else if mnth = 2 andalso isLeap
    then 29
    else if mnth = #1 (hd mnthDays)
    then #2 (hd mnthDays)
    else get_day_cap(isLeap, mnth, (tl mnthDays))
				      
fun valid_day (date: (int*int*int))=
    let val mnthDays = [(1,31),(2,28),(3,31),(4,30),
			     (5,31),(6,30),(7,31),(8,31),
			     (9,30),(10,31),(11,30),(12,31)]
    in
	if (#2 date > 0) andalso (#3 date <= get_day_cap (is_leap(#1 date), #2 date, mnthDays))
	then true
	else false
    end
							      
fun reasonable_date (date : (int*int*int))=
    #1 date > 0 andalso valid_month (#2 date) andalso valid_day (date);
		   
		    
		     
		     
		     
