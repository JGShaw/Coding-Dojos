import Test.HUnit
import SimpleAutomaton

testAutomaton expected input = TestCase $ assertEqual "" expected (SimpleAutomaton.q1 input)

tests = TestList [TestLabel "T1" (testAutomaton False  [1, 0, 0, 1, 0]),
                  TestLabel "T2" (testAutomaton True   [1, 0, 0, 1, 0, 1]),
                  TestLabel "T3" (testAutomaton True   [1, 0, 0, 1, 0, 0]),
                  TestLabel "T4" (testAutomaton False  [0]),
                  TestLabel "T5" (testAutomaton True   [1, 1])
                 ]
