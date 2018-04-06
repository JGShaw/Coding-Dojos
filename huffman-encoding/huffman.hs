module Huffman where

import Data.Tuple
import Data.Maybe
import Data.List

data Tree a = Empty | Leaf a Int | Node (Tree a) (Tree a) deriving (Show, Eq)
data Symbol = Zero | One deriving (Show, Eq)
type Encoding = [Symbol]

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
tree_encode (Leaf value _) symbol = if value == symbol then Just [] else Nothing
tree_encode (Node t1 t2) symbol
  | isJust zero_tree = Just $ Zero : fromJust zero_tree
  | isJust one_tree = Just $ One : fromJust one_tree
  | otherwise = Nothing
  where
    zero_tree = tree_encode t1 symbol
    one_tree = tree_encode t2 symbol

decode :: Tree a -> Encoding -> [a]
decode (Leaf a _) _ = [a]
decode _ [] = []
decode tree input = symbol : decode tree (drop prefix_length input)
  where
    matching_symbols = map (tree_decode tree) $ inits input 
    Just (prefix_length, Just symbol) = find (isJust . snd) $ zip [0..] matching_symbols

tree_decode :: Tree a -> Encoding -> Maybe a
tree_decode (Leaf x _) [] = Just x
tree_decode (Node zero one) (hd : tl)
  | hd == Zero = tree_decode zero tl
  | hd == One = tree_decode one tl
tree_decode _ _  = Nothing
