{-# LANGUAGE TemplateHaskell #-}
module GreedyTheif where

import Test.QuickCheck

data Item = Item { weight :: Int, value :: Int } deriving (Show, Eq)

instance Arbitrary Item where
   arbitrary = do
     Positive weight <- arbitrary
     Positive value <- arbitrary
     return $ Item  weight value

test_items :: [Item]
test_items = [(Item 2 6), (Item 2 3), (Item 6 5), (Item 5 4), (Item 4 6)]

steal_items :: [Item] -> Int -> [Item]
steal_items items max_weight = []


prop_subset :: [Item] -> Int -> Bool
prop_subset items max_weight = subset items (steal_items items max_weight)

subset :: (Eq a) => [a] -> [a] -> Bool
subset _ [] = True
subset list (x:xs) = (x `elem` list) && subset list xs

prop_under_max_weight :: [Item] -> Positive Int -> Bool
prop_under_max_weight items (Positive max_weight) = max_weight >= (sum $ map weight $ steal_items items max_weight)

return []
runTests = $quickCheckAll
