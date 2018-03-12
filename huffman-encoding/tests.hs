import Test.Hspec
import Test.QuickCheck
import Huffman
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
  describe "Huffman" $ do
    it "encode / decode test" $
      property $ \x -> decode (fst $ encode x) (snd $ encode x) == (x :: String)
    {- it "can encode a string" $ do -}
      {- snd (encode "aaaabcc") `shouldBe` "0000101111" -}
    
    {- it "can decode a string" $ do -}
      {- let tree = Node (Leaf 'a' 4) (Node (Leaf 'b' 1) (Leaf 'c' 2)) -}
      {- decode tree "0000101111" `shouldBe` "aaaabcc" -}
