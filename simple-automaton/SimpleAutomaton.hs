module SimpleAutomaton where

q1 :: [Int] -> Bool
q1 [] = False
q1 (0:tl) = q1 tl
q1 (1:tl) = q2 tl

q2 :: [Int] -> Bool
q2 [] = True
q2 (0:tl) = q3 tl
q2 (1:tl) = q2 tl

q3 :: [Int] -> Bool
q3 [] = False
q3 (_:tl) = q2 tl
