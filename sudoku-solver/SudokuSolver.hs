module SudokuSolver where

import Data.Either
import Data.List

type Value = Either Integer [Integer]
type Square = (Integer, Value)
type Sudoku = [Square]

solve :: [Integer] -> [Integer]
solve input = map square_to_int solved
  where
    sudoku = zip [0..] (map int_to_value input)
    solved = solve' sudoku

int_to_value :: Integer -> Value
int_to_value 0 = Right []
int_to_value x = Left x

square_to_int :: Square -> Integer
square_to_int (_, Left x) = x
square_to_int (_, Right _) = 0

solve' :: Sudoku -> Sudoku
solve' input = if finished then populated else solve' populated
  where
    populated = fill_in_possibles input input
    finished = all (\(_, sq) -> isLeft sq) populated

fill_in_possibles :: Sudoku -> Sudoku -> Sudoku
fill_in_possibles [] _ = []
fill_in_possibles (square@(index, value) : tl) reference 
  | isLeft value = square : rec_call
  | isRight value = new_square : rec_call
  where
    numbers_in_row = get_knowns (\(i, _) -> i `div` 9 == index `div` 9) reference
    numbers_in_column = get_knowns (\(i, _) -> i `mod` 9 == index `mod` 9) reference
    numbers_in_square = get_knowns (\(i, _) -> i `elem` square_indecies index ) reference
    possibles = [1..9] \\ (numbers_in_row ++ numbers_in_column ++ numbers_in_square)
    new_square = (index, if length possibles == 1 then Left (head possibles) else Right possibles)
    rec_call = fill_in_possibles tl reference

get_knowns :: (Square -> Bool) -> Sudoku -> [Integer]
get_knowns pred puzzle = lefts $ map snd $ filter pred puzzle

row_indecies :: Integer -> [Integer]
row_indecies index = []

column_indecies :: Integer -> [Integer]
column_indecies index = []

square_indecies :: Integer -> [Integer]
square_indecies index = filter (\x -> (column index == column x && row index == row x)) [0..80]
  where
    column = \x -> (x `div` 3) `mod` 3
    row = \x -> x `div` 27
