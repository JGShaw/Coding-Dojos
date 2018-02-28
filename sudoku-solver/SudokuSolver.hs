module SudokuSolver where

import Data.Either
import Data.List

type Square = (Integer, Integer)
type Sudoku = [Square]

solve :: [Integer] -> [Integer]
solve input = map snd solved
  where
    sudoku = zip [0..] input
    solved = solve' sudoku

solve' :: Sudoku -> Sudoku
solve' input = if finished then populated else solve' populated
  where
    populated = fill_in_possibles input input
    finished = all (\(_, value) -> value /= 0) populated

fill_in_possibles :: Sudoku -> Sudoku -> Sudoku
fill_in_possibles [] _ = []
fill_in_possibles (square@(index, value) : tl) reference 
  | value /= 0 = square : rec_call
  | otherwise = new_square : rec_call
  where
    conflicting_values = get_knowns (conflicting_indecies index) reference
    possibles = [1..9] \\ conflicting_values 
    new_square = (index, if length possibles == 1 then (head possibles) else 0)
    rec_call = fill_in_possibles tl reference

get_knowns :: [Integer] -> Sudoku -> [Integer]
get_knowns indecies puzzle = map snd $ filter (\(i, value) -> i `elem` indecies && value /= 0) puzzle

conflicting_indecies :: Integer -> [Integer]
conflicting_indecies index = filter (\x -> row x || column x || (sq_column x && sq_row x) ) [0..80]
  where
    row = \x -> x `div` 9 == index `div` 9
    column = \x -> x `mod` 9 == index `mod` 9
    sq_row = \x -> x `div` 27 == index `div` 27 
    sq_column = \x -> (x `div` 3) `mod` 3 == (index `div` 3) `mod` 3
