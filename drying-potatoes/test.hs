import Test.Hspec
import Control.Exception (evaluate)

import DryingPotatoes

main :: IO ()
main = hspec $ do
  describe "Drying potatoes" $ do
    it "example_1" $ do
      potatoes 99 100 98 `shouldBe` 50
    
    it "example_2" $ do
      potatoes 82 127 80 `shouldBe` 114
    
    it "example_3" $ do
      potatoes 93 129 91 `shouldBe` 100
