import Test.HUnit
import Test.QuickCheck
import PasswordChecker
import Data.Char

testDistance expected input = TestCase $ assertEqual "" expected (PasswordChecker.distance input)

tests = TestList [TestLabel "Abcdef123 is strong" (testDistance 0 "Abcdef123"),
                  TestLabel "aabbccddEE1234567890 is strong" (testDistance 0 "aabbccddEE1234567890"),
                  TestLabel "AaAcb1 is strong" (testDistance 0 "AaAcb1"),
                  TestLabel "ABCdefghij1234567890a is one digit too long" (testDistance 1 "ABCdefghij1234567890a"),
                  TestLabel "aB123 requires another character" (testDistance 1 "aB123"),
                  TestLabel "abc123 requires an upper case letter" (testDistance 1 "abc123"),
                  TestLabel "ABC123 requires a lower case letter" (testDistance 1 "ABC123"),
                  TestLabel "aaaBcde123 has too many repeating a's" (testDistance 1 "aaaBcde123"),
                  TestLabel "ABCdef requires a digit to fix the length" (testDistance 1 "ABCdef"),
                  TestLabel "ABCde requires an additional digit" (testDistance 1 "ABCde"),
                  TestLabel "aaaaaa requires a upper case letter and a digit" (testDistance 2 "aaaaaa"),
                  TestLabel "aaa1234567890ABCDEFGH can be made valid by removing one of the leading a's" (testDistance 1 "aaa1234567890ABCDEFGH"),
                  TestLabel "11123 can be made valid in 2 changes" (testDistance 2 "11123"),
                  TestLabel "111 can be made valid in 3 changes" (testDistance 3 "111"),
                  TestLabel "111222333444 repeating digits can be made valid by replacement with upper and lower case letters" (testDistance 4 "111222333444"),
                  TestLabel "Empty password requires 6 changes" (testDistance 6 ""),
                  TestLabel "123456789012345678999" (testDistance 3 "123456789012345678999")
                 ]

prop_minLength :: String -> Bool
prop_minLength password
  | length password < 6 = (PasswordChecker.distance password) >= 6 - (length password)
  | otherwise = True

prop_maxLength :: String -> Bool
prop_maxLength password
  | length password > 20 = (PasswordChecker.distance password) >= (length password) - 20
  | otherwise = True

prop_onlyOneType :: String -> Bool
prop_onlyOneType password
  | onlyLowers || onlyUppers || onlyDigits = (PasswordChecker.distance password) >= 2
  | otherwise = True
  where
    onlyLowers = all isLower password
    onlyUppers = all isUpper password
    onlyDigits = all isDigit password

prop_everyGroupRequiresChange :: String -> Bool
prop_everyGroupRequiresChange password = (PasswordChecker.distance password) >= (PasswordChecker.countGroups password)

prop_all :: String -> Bool
prop_all password = and [minLength, maxLength, onlyOneType, everyGroupRequiresChange]
  where
    minLength = prop_minLength password
    maxLength = prop_maxLength password
    onlyOneType = prop_onlyOneType password
    everyGroupRequiresChange = prop_everyGroupRequiresChange password
