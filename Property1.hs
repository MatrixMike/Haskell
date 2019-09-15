import qualified Data.List as List
import           Hedgehog
import qualified Hedgehog.Gen as Gen
import qualified Hedgehog.Range as Range

genIntList :: Gen [Int]
genIntList =
  let listLength = Range.linear 0 100000
  in  Gen.list listLength Gen.enumBounded

prop_reverse :: Property
prop_reverse =
  property $ do
    xs <- forAll genIntList
    List.reverse (List.reverse xs) === xs
