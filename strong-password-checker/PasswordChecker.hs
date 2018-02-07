module PasswordChecker where

import Data.Maybe
import Data.Char
import qualified Data.List as List 

distance :: String -> Int
distance password 
  | length password < 6 = minAdds
  | length password > 20 = maximum [minDels, groups] + minAdds
  | otherwise = maximum [minAdds - minDels, groups]
  where
    minAdds = countAdditions password
    minDels = countDeletions password
    groups = countGroups password

countAdditions :: String -> Int
countAdditions password = maximum [neededForLength, lowersNeeded + uppersNeeded + digitsNeeded] 
  where
    lowersNeeded = if any isLower password then 0 else 1
    uppersNeeded = if any isUpper password then 0 else 1
    digitsNeeded = if any isDigit password then 0 else 1
    neededForLength = 6 - (length password)

countDeletions :: String -> Int
countDeletions password = if (length password) > 20 then (length password) - 20 else 0

countGroups :: String -> Int
countGroups [] = 0
countGroups (_:[]) = 0
countGroups (_:_:[]) = 0
countGroups (x:y:z:tail)
  | (x == y) && (y == z) = 1 + countGroups tail
  | otherwise = countGroups (y:z:tail)
