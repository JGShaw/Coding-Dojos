import Test.Hspec
import Test.QuickCheck
import Huffman
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
  describe "Huffman" $ do
    it "can encode a string" $ do
      snd (encode "aaaabcc") `shouldBe` "0000111010"
    
    it "can decode a string" $ do
      let tree = Node (Leaf 'a' 4) (Node (Leaf 'c' 2) (Leaf 'b' 1))
      decode tree "0000111010" `shouldBe` "aaaabcc"
    
    it "encode / decode test" $
      property $ \x -> decode (fst $ encode x) (snd $ encode x) == (x :: String)
