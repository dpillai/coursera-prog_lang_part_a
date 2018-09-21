(* Assignment 1 : Question 1 *)
fun is_older (date1 : int*int*int, date2 : int*int*int)=
    if #1 date1 < #1 date2
       orelse #2 date1 < #2 date2
       orelse #3 date1 < #3 date2
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
    else dates_in_month(dates, hd mnths)  @ dates_in_months(dates, tl mnths)
