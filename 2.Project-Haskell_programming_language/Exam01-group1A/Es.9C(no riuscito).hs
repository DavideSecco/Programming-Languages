{- Implement permuteL function printing all (length !) permutations of the list given as a parameter. You can 
reimplement the previous task and instead of adding the second element to the pair, add all (length - 1) ! 
permutations of the list with removed element. This will require a recursive call of permuteL and handle the situation 
ending recursion (passing an empty list as a parameter). For example: permuteL [1,2,3] should return: 
[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]] -}

