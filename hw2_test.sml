(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "homework02.sml";

val test_is_older1 = is_older ((2017,12,30),(2017,12,31)) = true;
val test_is_older2 = is_older ((2017,10,31),(2017,11,30)) = true;   
val test_is_older3 = is_older ((2017,11,29),(2017,12,30)) = true;
val test_is_older4 = is_older ((2017,12,31),(2018,1,1)) = true;
val test_is_older5 = is_older ((2017,12,31),(2017,12,31)) = false;		  

val test_num_of_month1 = number_in_month ([],2) = 0;			 
val test_num_of_month2 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1;
val test_num_of_month3 = number_in_month ([(2012,2,28),(2013,12,1),(2012,2,23)],2) = 2;
val test_num_of_month4 = number_in_month ([(2012,2,28),(2013,12,1),(2012,2,12),(2012,2,23)],2) = 3;

val test_number_in_months1 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2]) = 1
val test_number_in_months2 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3]) = 2
val test_number_in_months3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test_number_in_months4 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0

val test_dates_in_month1 = dates_in_month ([(2012,2,22),(2013,12,1)],2) = [(2012,2,22)]			
val test_dates_in_month2 = dates_in_month ([(2013,12,1),(2012,2,22),(2012,2,28)],2) = [(2012,2,22),(2012,2,28)]
val test_dates_in_month3 = dates_in_month ([(2012,2,22),(2013,12,1),(2012,2,28)],2) = [(2012,2,22),(2012,2,28)]

val test_dates_in_months1 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
(*
val test_gen_nth1 = get_nth (["hi", "there", "how", "are", "you"], 1) = "hi"	
val test_gen_nth2 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"
val test_gen_nth3 = get_nth (["hi", "there", "how", "are", "you"], 3) = "how"
val test_gen_nth4 = get_nth (["hi", "there", "how", "are", "you"], 5) = "you"    
													      
val test_date_to_string = date_to_string (2013, 6, 1) = "June 1, 2013"
							    
val test_number_before_reaching_sum1 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3	
val test_number_before_reaching_sum2 = number_before_reaching_sum (1, [2]) = 0
val test_number_before_reaching_sum3 = number_before_reaching_sum (5, [3,1,2]) = 2
val test_number_before_reaching_sum4 = number_before_reaching_sum (5, [3,2,2]) = 1
											  
val test_what_month1 = what_month 70 = 3
val test_what_month2 = what_month 247 = 9
val test_what_month3 = what_month 320 = 11
val test_what_month4 = what_month 4 = 1
val test_what_month5 = what_month 82 = 3											 

val test_month_range1 = month_range (31, 34) = [1,2,2,2]
val test_month_range2 = month_range (32, 34) = [2,2,2]
val test_month_range3 = month_range (30, 34) = [1,1,2,2,2]

val test_oldest1 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)

val test_number_in_months_challenge1 =
    number_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2]) = 1
val test_number_in_months_challenge2 =
    number_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3]) = 2
val test_number_in_months_challenge3 =
    number_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,3,4]) = 3
val test_number_in_months_challenge4 =
    number_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0

val test_dates_in_months_challenge1 =
    dates_in_months_challenge ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,2,4]) = [(2011,3,31),(2012,2,28),(2011,4,28)]
*)
