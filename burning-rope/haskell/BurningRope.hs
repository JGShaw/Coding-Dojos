module BurningRope where

type Rope = [[Char]]
type Point = (Int, Int)

burn :: Rope -> Point -> Int
burn rope point = burn' rope 0 point

burn' :: Rope -> Int -> Point -> Int
burn' rope depth point = maximum $ map (\p -> burn' rope (depth + 1) p) next
  where 
    checker = rope_checker rope
    next = neighbours checker point

rope_checker :: Rope -> (Point -> Bool)
rope_checker rope = rope_checker' rope
rope_checker' :: Rope -> Point -> Bool
rope_checker' rope (x, y) = in_plane && is_rope
  where
    in_plane = x >= 0 && y >= 0 && y < length rope && x < length (rope !! y)
    is_rope = (rope !! y) !! x == 'R'

neighbours :: (Point -> Bool) -> Point -> [Point]
neighbours is_rope (x, y) = filter is_rope [up, down, left, right]
  where
    up = (x, y - 1)
    down = (x, y + 1)
    left = (x - 1, y)
    right = (x + 1, y)
