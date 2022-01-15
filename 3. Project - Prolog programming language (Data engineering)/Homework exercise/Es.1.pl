/* 
Implement a sort( list, List_sort ) predicate, that returns a not ascending List_sort 
list. Apply the chosen one sorting algorithm e.g. 
selection1
insertion2
buble3
merge4
quick5
etc ... (2 pkt.):
*/
insert_sort(List,List_sort):-sortt(List,[],List_sort).

sortt([],Acc,Acc).
sortt([H|T],Acc,List_sort):-insert(H,Acc,NewAcc),sortt(T,NewAcc,List_sort).
   
insert(X,[Y|T],[Y|NT]):-X>Y,insert(X,T,NT).
insert(X,[Y|T],[X,Y|T]):-X=<Y.
insert(X,[],[X]).