(*
val test_is_older1 = is_older ((2017,12,30),(2017,12,31)) = true;
val test_is_older2 = is_older ((2017,10,31),(2017,11,30)) = true;   
val test_is_older3 = is_older ((2017,11,29),(2017,12,30)) = true;
val test_is_older4 = is_older ((2017,12,31),(2018,1,1)) = true;
val test_is_older5 = is_older ((2017,12,31),(2017,12,31)) = false;
val test_is_older6 = is_older ((2015,12,31),(2017,12,31)) = true;
val test_is_older7 = is_older ((2012,2,28),(2011,12,31)) = false;
*)
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
