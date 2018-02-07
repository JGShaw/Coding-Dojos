import Data.List (take, drop, splitAt)
import Data.Set (Set, insert, empty, toList, fromList, (\\), singleton, union)
import System.Environment

type Potion = Int
type Smoke = Int
type Mix = (Potion, Smoke)
type PotionSet = ([Potion], Smoke)


mix_potions :: Potion -> Potion -> Mix
mix_potions p1 p2 = ((p1 + p2) `mod` 100, p1 * p2)


mix_at_index :: Int -> PotionSet -> PotionSet
mix_at_index i (potions, smoke) = (pre_potions ++ [p_mix] ++ post_potions, smoke + s_mix)
    where
        (pre_potions, p1:p2:post_potions) = splitAt i potions
        (p_mix, s_mix) = mix_potions p1 p2


generate_all_mixes :: PotionSet -> Set PotionSet
generate_all_mixes ps@(potions, _) = fromList [mix_at_index i ps | i <- [0..(length potions - 2)]]


explore :: Set PotionSet -> [PotionSet] -> Smoke -> Smoke
explore _ [] min_smoke = min_smoke
explore visited (hd@(hd_potions, hd_smoke):tl) min_smoke
    | length hd_potions == 1 && hd_smoke < min_smoke = cont hd_smoke
    | otherwise = cont min_smoke
    where
        successors = generate_all_mixes hd
        trimmed = successors \\ visited
        new_visited = union trimmed visited
        new_frontier = toList trimmed ++ tl
        cont = explore new_visited new_frontier


find_min_smoke :: [Potion] -> Smoke
find_min_smoke p = explore (singleton (p, 0)) [(p, 0)] 9999999


main = do
  args <- getArgs
  putStrLn $ show $ find_min_smoke $ map read args
