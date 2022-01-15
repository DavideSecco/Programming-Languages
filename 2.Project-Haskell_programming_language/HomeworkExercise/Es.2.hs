{-# OPTIONS_GHC -Wno-deferred-out-of-scope-variables #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-Write a program to solve propositional calculus1 with: negation (N), conjunction (C), alternative (A) and
implication “conditional” (I) functors.
Sentence type: data Sentence = S Char | … - i.e. the variable can be any variable S
Example sentence: (I (N (S 'p')) (A (C (S 'p') (S 'q')) (S 'r')))
Program should:
1) contains a function: print sentence – (1.5 pts.)
for a given example (I (N (S 'p')) (A (C (S 'p') (S 'q')) (S 'r')))
the output should be "(~p => ((p & q) | r))"
2) contains a function: write_variables sentence – (1.5 pts.)
for a given example (I (N (S 'p')) (A (C (S 'p') (S 'q')) (S 'r')))
the output should be [p, q, r] (not necessarily sorted, but unique)
3) contains a function: check sentence values_map – (1.5 pts.)
for a given example (I (N (S 'p')) (A (C (S 'p') (S 'q')) (S 'r')))
and values map fromList [('p', False), ('q', True), ('r', False)]
the output should be False
4) contains one of the functionalities a/b – (1.5 pts.)
4a) perform tasks 1-3 for Łukasiewicz's three-valued logic2 True/False/Nothing
4b) contains a function: is_tautology checking whether the sentence is true for any valuation of variables in the formula.
-}

-- 2 exercise
check :: Eq t => [t] -> t -> Bool
check list val = do
    if null list
        then False
    else if head list == val
        then True
    else
        check (tail list) val

funz :: [Char] -> [Char]
funz phrase = do
    let l = []
    let carattere = "'"
    if null phrase
        then l
    else if head phrase == head carattere
        then l ++ [head (tail phrase)] ++ funz (drop 3 phrase)
    else
        l ++ funz (tail phrase)


write_variables :: [Char]  -> [Char]
write_variables phrase = doppioni (funz phrase)

doppioni :: [Char] -> [Char]
doppioni l = do
    let l2 = []
    if null l
        then l2
    else
        if check (tail l) (head l)
            then l2 ++ doppioni (tail l)
        else
            l2 ++ [head l] ++ doppioni (tail l)

-- 1° exercise
printSentence :: String -> String
printSentence phrase = do
    let sentence = ""
    let carattere = "'"
    if null phrase
        then ""
    else if head phrase == head carattere
        then concat(sentence, take 1 (tail phrase) ++ printSentence (drop 3 phrase) )
    else if head phrase == 'A'
        then concat(sentence, " | " ++ printSentence (drop 3 phrase) )
    else if head phrase == 'N'
        then concat(sentence, " ~ " ++ printSentence (drop 3 phrase) )
    else if head phrase == 'C'
        then concat(sentence, " & " ++ printSentence (drop 3 phrase) )
    else
        concat (sentence, printSentence (tail phrase))

main :: IO ()
main = do
    let phrase = "(I (N (S 'p')) (A (C (S 'p') (S 'q')) (S 'r')))"
    print ("The phrase is: " ++ phrase)

    let sentence = printSentence phrase
    print("first quest: " ++ sentence)

    let variables = write_variables phrase
    print ("Second quest: " ++ variables)
    