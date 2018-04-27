module DryingPotatoes where

potatoes :: Float -> Float -> Float -> Int
potatoes start_water weight end_water = round $ dry_matter / ((100.0 - end_water) / 100.0)
  where
    water_weight = (start_water * weight) / 100.0
    dry_matter = weight - water_weight 
