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
    finished = all ((/=0) . snd) populated

fill_in_possibles :: Sudoku -> Sudoku -> Sudoku
fill_in_possibles [] _ = []
fill_in_possibles ((index, 0) : tl) reference = new_square : fill_in_possibles tl reference
  where 
    possibles = [1..9] \\ (map snd $ get_knowns index reference)
    new_square = (index, if length possibles == 1 then (head possibles) else 0)
fill_in_possibles (square : tl) reference = square : fill_in_possibles tl reference

get_knowns :: Integer -> Sudoku -> [Square]
get_knowns index puzzle = filter (\(i, value) -> (is_index_conflicting i index) && value /= 0) puzzle

is_index_conflicting :: Integer -> Integer -> Bool
is_index_conflicting x1 x2 = row || column || (sq_column && sq_row)
  where
    row = x1 `div` 9 == x2 `div` 9
    column = x1 `mod` 9 == x2 `mod` 9
    sq_row = x1 `div` 27 == x2 `div` 27 
    sq_column = (x1 `div` 3) `mod` 3 == (x2 `div` 3) `mod` 3
