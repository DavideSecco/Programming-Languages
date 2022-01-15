/* Please implement the is_sorted(List, Res) predicate taking a list of natural numbers and returning the answer 
Yes if the list is sorted and No otherwise. */

is_sorted([], Res):- Res = "yes".
is_sorted([_], Res):- Res = "yes".
is_sorted([A|[B|T]], Res):- (A<B, is_sorted([B|T], Res)); Res = "No".

/* 
is_sorted([1,2,3], Res).
is_sorted([2,5,3], Res).
*/

/* ALTERNATIVE VERSION: */
is_sorted2([]).
is_sorted2([_]).
is_sorted2([A|[B|T]]):- A<B, is_sorted2([B|T]).

