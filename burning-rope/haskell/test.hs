import Test.HUnit
import BurningRope

testRopeBurn = BurningRope.burn [ "   R  ", 
                                  "   R  ", 
                                  " RRRR ", 
                                  "   R  ", 
                                  "   R  ", 
                                  "   R  " ]

testBurn expected point = TestCase $ assertEqual "" expected (testRopeBurn point)

tests = TestList [TestLabel "T1" (testBurn 5 (0, 3)),
                  TestLabel "T2" (testBurn 3 (2, 3)),
                  TestLabel "T3" (testBurn 5 (5, 3)),
                  TestLabel "T4" (testBurn 4 (2, 4)),
                  TestLabel "T5" (testBurn (-1) (0, 0))
                 ]
