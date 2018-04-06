import Test.Hspec
import Test.QuickCheck
import Huffman
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
  describe "Huffman" $ do
    it "can encode a string" $ do
      snd (encode "aaaabcc") `shouldBe` [Zero, Zero, Zero, Zero, One, One, One, Zero, One, Zero]
    
    it "can decode a string" $ do
      let tree = Node (Leaf 'a' 4) (Node (Leaf 'c' 2) (Leaf 'b' 1))
      decode tree [Zero, Zero, Zero, Zero, One, One, One, Zero, One, Zero] `shouldBe` "aaaabcc"
    
    it "encode / decode property" $
      property $ \x -> (fst $ encode x) (snd $ encode x) == (x :: String)
