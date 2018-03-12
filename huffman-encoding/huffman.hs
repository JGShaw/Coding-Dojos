module Huffman where

import Data.Tuple
import Data.Maybe
import Data.List

data Tree a = Empty | Leaf a Int | Node (Tree a) (Tree a) 
  deriving (Show, Eq)

encode :: Eq a => Ord a => [a] -> (Tree a, String)
encode s = (tree, encoded) 
  where
    chars = map (\xs -> (head xs, length xs))  (group $ sort s)
    leaves = sort_trees $ map (\(val, count) -> Leaf val count) chars 
    tree = encode' leaves
    encoded = concatMap (fromJust . tree_encode tree) s
    
encode' :: [Tree a] -> Tree a
encode' [] = Empty
encode' [hd] = hd
encode' (hd1 : hd2 : tl) = encode' $ sort_trees $ Node hd1 hd2 : tl

sort_trees :: [Tree a] -> [Tree a]
sort_trees = sortBy (\a b -> compare (tree_sum a) (tree_sum b))

tree_sum :: Tree a -> Int
tree_sum Empty = 0
tree_sum (Leaf _ x) = x
tree_sum (Node t1 t2) = (tree_sum t1) + (tree_sum t2)


decode :: Tree a -> String -> [a]
decode (Leaf a _) _ = [a]
decode tree input = decode' tree input []

decode' :: Tree a -> String -> String-> [a]
decode' _ [] _ = []
decode' tree (hd : tl) prefix
  | isJust result = fromJust result : decode' tree tl []
  | otherwise = decode' tree tl new_prefix
  where  
    new_prefix = prefix ++ [hd]
    result = tree_decode tree new_prefix


tree_encode :: Eq a => Tree a -> a -> Maybe String
tree_encode Empty _ = Nothing 
tree_encode (Leaf x _) symbol = if x == symbol then Just "" else Nothing
tree_encode (Node t1 t2) symbol
  | isJust zero = Just $ '0' : fromJust zero
  | isJust one = Just $ '1' : fromJust one
  | otherwise = Nothing
  where
    zero = tree_encode t1 symbol
    one = tree_encode t2 symbol

tree_decode :: Tree a -> String -> Maybe a
tree_decode (Leaf x _) [] = Just x
tree_decode (Node zero one) (hd : tl)
  | hd == '0' = tree_decode zero tl
  | hd == '1' = tree_decode one tl
tree_decode _ _  = Nothing
