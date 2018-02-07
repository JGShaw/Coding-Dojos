module AlienDictionary where

import Data.List
import Data.Graph
import Data.Tuple

ordering :: [String] -> [Char]
ordering input
  | noSccs && allReachable =  map (\(x, y, z) -> x) named
  | otherwise = []
  where
    (graph, vertexToName) = makeGraph input
    topOrder = topSort graph
    numVertices = length $ vertices graph
    noSccs = length (scc graph) == numVertices
    allReachable = allPathsAreFull graph topOrder
    named = map vertexToName topOrder

allPathsAreFull :: Graph -> [Vertex] -> Bool
allPathsAreFull _ [] = True
allPathsAreFull _ (x:[]) = True
allPathsAreFull graph rem@(x:xs) = testPasses && allPathsAreFull graph xs
  where
    testPasses = length (reachable graph x) == length rem 

makeGraph :: [String] -> (Graph, Vertex -> (Char, Char, [Char]))
makeGraph input = (graph, vertexToName)
  where
    graphRules = rules input
    keys = nub $ concat input
    (graph, vertexToName, _) = graphFromEdges $ map (\key -> (key, key, map snd (filter (\(x, y) -> x == key) graphRules))) keys

rules :: [String] -> [(Char, Char)]
rules [] = []
rules [[]] = []
rules input = newRules ++ subRules
  where
    groups = groupBy (\a b -> head a == head b)  input
    firsts = map (head . head) groups
    newRules = getRules firsts
    subRules = concatMap rules $ map (\group -> map tail group) groups

getRules :: [Char] -> [(Char, Char)]
getRules [] = []
getRules (_:[]) = []
getRules (x1:tl@(x2:xs)) = (x1, x2) : getRules tl
