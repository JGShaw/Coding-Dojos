import Test.Hspec
import Test.QuickCheck
import Huffman
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
  describe "Huffman" $ do
    it "encode / decode test" $
      property $ \x -> decode (fst $ encode x) (snd $ encode x) == (x :: String)
