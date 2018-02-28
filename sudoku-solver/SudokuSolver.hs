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
    impossible_indecies = (row_indecies index) ++ (column_indecies index) ++ (square_indecies index)
    impossible_values = get_knowns impossible_indecies reference
    possibles = [1..9] \\ impossible_values 
    new_square = (index, if length possibles == 1 then Left (head possibles) else Right possibles)
    rec_call = fill_in_possibles tl reference

get_knowns :: [Integer] -> Sudoku -> [Integer]
get_knowns indecies puzzle = lefts $ map snd $ filter (\(i, _) -> i `elem` indecies) puzzle

row_indecies :: Integer -> [Integer]
row_indecies index = filter (\x -> index `div` 9 == x `div` 9) [0..80]

column_indecies :: Integer -> [Integer]
column_indecies index = filter (\x -> index `mod` 9 == x `mod` 9) [0..80]

square_indecies :: Integer -> [Integer]
square_indecies index = filter (\x -> (column index == column x && row index == row x)) [0..80]
  where
    column = \x -> (x `div` 3) `mod` 3
    row = \x -> x `div` 27
