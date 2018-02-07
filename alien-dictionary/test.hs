import Test.HUnit
import AlienDictionary

testOrdering expected input = TestCase $ assertEqual "" expected (AlienDictionary.ordering input)

tests = TestList [TestLabel "Test case 1" (testOrdering "wertf" ["wrt", "wrf", "er", "ett", "rftt"]),
                  TestLabel "Test case 2" (testOrdering "zx" ["z", "x"]),
                  TestLabel "Test case 3" (testOrdering "" ["z", "x", "z"]),
                  TestLabel "Ambiguous ordering" (testOrdering "" ["ab", "ac", "ad"]),
                  TestLabel "Cycle" (testOrdering "" ["a", "b", "c", "d", "b"]),
                  TestLabel "no link between a > b and c > d" (testOrdering "" ["ac", "ad", "bc", "bd"]),
                  TestLabel "no link between a > b and c > d and a cycle" (testOrdering "" ["ac", "ad", "bc", "bd", "ac"]),
                  TestLabel "placement of d is ambiguous" (testOrdering "" ["c", "ac", "ad", "bc", "bd"]),
                  TestLabel "Allowed" (testOrdering "cabd" ["c", "ac", "ad", "bc", "bd", "d"]),
                  TestLabel "Allowed where first letter is not the root node" (testOrdering "ac" ["ca", "cc"]),
                  

                  TestLabel "j1" (testOrdering "z" ["z"]),
                  TestLabel "j2" (testOrdering "acdz" ["azc", "azd", "cdd", "cdz"]),
                  TestLabel "j3" (testOrdering "" ["wrt", "wrf", "er", "ett", "rfttf", "rfttt"]),
                  TestLabel "j4" (testOrdering "" ["zx", "zb", "b", "x"]),
                  TestLabel "j5" (testOrdering "" ["za", "zb", "b"]),
                  TestLabel "j6" (testOrdering "" ["zx", "zb", "za"]),
                  TestLabel "j7" (testOrdering "cdaz" ["cdd", "cdz", "azc", "azd", "aza", "z"]),


                  TestLabel "k1" (testOrdering "" ["za", "zb", "zc"]),
                  TestLabel "k2" (testOrdering "" ["za", "zb", "cd"]) 
                 ]
