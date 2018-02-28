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
    populated = map (fill_in_possibles input) input
    finished = all ((/= 0) . snd) populated

fill_in_possibles :: Sudoku -> Square -> Square
fill_in_possibles reference (index, 0) = (index, if length possibles == 1 then (head possibles) else 0)
  where 
    possibles = [1..9] \\ (get_knowns reference index)
fill_in_possibles _ square = square

get_knowns :: Sudoku -> Integer -> [Integer]
get_knowns sudoku index = map snd $ filter (\(i, value) -> (is_index_conflicting i index) && value /= 0) sudoku

is_index_conflicting :: Integer -> Integer -> Bool
is_index_conflicting x1 x2 = row || column || (sq_column && sq_row)
  where
    row = x1 `div` 9 == x2 `div` 9
    column = x1 `mod` 9 == x2 `mod` 9
    sq_row = x1 `div` 27 == x2 `div` 27 
    sq_column = (x1 `div` 3) `mod` 3 == (x2 `div` 3) `mod` 3
