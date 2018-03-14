module Huffman where

import Data.Tuple
import Data.Maybe
import Data.List

data Tree a = Empty | Leaf a Int | Node (Tree a) (Tree a) 
  deriving (Show, Eq)

type Encoding = String

encode :: Eq a => [a] -> ((Encoding -> [a]), Encoding)
encode s = (decode tree, encoded) 
  where
    leaves = sort_trees $ map (\xs -> Leaf (head xs) (length xs)) $ group_elems s 
    tree = fold_trees leaves
    encoded = concatMap (fromJust . tree_encode tree) s
    
group_elems :: Eq a => [a] -> [[a]]
group_elems [] = []
group_elems xs = match : group_elems not_match 
  where
    (match, not_match) = partition ((==) (head xs)) xs

fold_trees :: [Tree a] -> Tree a
fold_trees [] = Empty
fold_trees [hd] = hd
fold_trees (hd1 : hd2 : tl) = fold_trees $ sort_trees $ Node hd2 hd1 : tl

sort_trees :: [Tree a] -> [Tree a]
sort_trees = sortBy $ \a b -> compare (tree_sum a) (tree_sum b)

tree_sum :: Tree a -> Int
tree_sum Empty = 0
tree_sum (Leaf _ x) = x
tree_sum (Node t1 t2) = tree_sum t1 + tree_sum t2

tree_encode :: Eq a => Tree a -> a -> Maybe Encoding
tree_encode Empty _ = Nothing 
tree_encode (Leaf x _) symbol = if x == symbol then Just "" else Nothing
tree_encode (Node t1 t2) symbol
  | isJust zero = Just $ '0' : fromJust zero
  | isJust one = Just $ '1' : fromJust one
  | otherwise = Nothing
  where
    zero = tree_encode t1 symbol
    one = tree_encode t2 symbol

decode :: Tree a -> Encoding -> [a]
decode (Leaf a _) _ = [a]
decode tree [] = []
decode tree input = symbol : decode tree (drop index input)
  where
    prefixs = map (\x -> tree_decode tree x) $ inits input 
    (index, Just symbol) = fromJust $ find (\(a,b) -> isJust b) (zip [0..] prefixs)

tree_decode :: Tree a -> Encoding -> Maybe a
tree_decode (Leaf x _) [] = Just x
tree_decode (Node zero one) (hd : tl)
  | hd == '0' = tree_decode zero tl
  | hd == '1' = tree_decode one tl
tree_decode _ _  = Nothing
