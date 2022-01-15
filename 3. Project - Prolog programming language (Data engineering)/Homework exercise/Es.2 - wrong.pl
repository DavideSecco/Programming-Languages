/*
2. Implement is_graphic( list, response ) predicate, stating whether the list 
creates a graphic sequence6
. Use the sort predicate from the previous task. (3 pkt.).
*/

/* 
I find the condition here:
https://www.quora.com/How-do-you-determine-if-a-sequence-is-graphic
*/
is_graphic(L, Res):- (summ(L, S), R = S mod 2, R =:= 0, check2(L), Res = "yess"); Res = "Nooooo".

/* first check: sum of values have to be even */
summ([], 0).
summ([A], A).
summ([A|T], A + Res):- summ(T, Res).

/* Second check: the max value of the list should be less than the lenght of the list. */
check2([A|T]):- Max is A,  max_value([A|T], Max), lenght([A|T], Len), Max =< Len.


max_value([], Max).
max_value([A], Max):- (A>=Max, Max is A).
max_value([A|T], Max):- (A>=Max, Max is A, max_value(T, Max)); max_value(T, Max).

lenght([], 0).
lenght([_], 1).
lenght([A|T], 1+Len):- lenght(T, Len).

