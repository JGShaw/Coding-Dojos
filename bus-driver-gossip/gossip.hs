import qualified Data.Set as Set
import qualified Data.List as List

type BusStop = Int
type Route = [BusStop]
type Gossip = Set.Set Int
type Driver = (Route, Gossip)

allGossipShared :: [Driver] -> Bool
allGossipShared drivers = foldl (\b (_, gossip) -> b && (Set.size gossip  == length drivers) ) True drivers

groupDrivers :: [Driver] -> [[Driver]]
groupDrivers drivers = List.groupBy (\(stop1:_, _) (stop2:_, _) -> stop1 == stop2) drivers

shareAtStop :: [Driver] -> [Driver]
shareAtStop drivers = map (\(_:route, z) -> (route, allGossip)) drivers
    where
      allGossip = Set.unions $ map snd drivers

shareGossip :: [Driver] -> [Driver]
shareGossip drivers = concat $ map shareAtStop (groupDrivers drivers) 

process :: [Driver] -> Int -> Maybe Int
process drivers 480 = Nothing
process drivers tick 
    | allGossipShared drivers = Just tick
    | otherwise = process (shareGossip drivers) (tick + 1)

createDrivers :: [Route] -> [Driver]
createDrivers routes = map (\(i, route) -> (cycle route, Set.singleton i)) $ zip [1..]  routes 

run :: [Route] -> Maybe Int
run routes = process (createDrivers routes) 0
