/* Please implement the is_sorted(List, Res) predicate taking a list of natural numbers and returning the answer 
Yes if the list is sorted and No otherwise. */

/* spiego la terza riga:
PROBABILMENTE una volta passato la funzione si entra in is_sorted(A, no)
che però è definito come is_sorted(A, yes) con davanti 
*/

is_sorted3([], Res):- Res = "yessss".
is_sorted3([_], Res):- Res = "yessss".
is_sorted3([A|[B|T]], Res):- (A<B, is_sorted3([B|T], Res)); Res = "Nooooo".

/* 
is_sorted([1,2,3], Res).
is_sorted([2,5,3], Res).
*/

/* ALTERNATIVE VERSION: */
is_sorted2([]).
is_sorted2([_]).
is_sorted2([A|[B|T]]):- A<B, is_sorted2([B|T]).

