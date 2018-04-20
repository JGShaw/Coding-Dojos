import Test.Hspec
import Test.QuickCheck
import LiveSession

main :: IO ()
main = hspec $ do
  describe "LiveSession" $ do
    it "test" $ do
      a `shouldBe` 1
    
