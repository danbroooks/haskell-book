module Tests.Ch17.Applicative where

import Prelude(Applicative((<*>), pure))
import Test.Tasty (TestTree, testGroup)
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck

tests :: TestTree
tests =
  testGroup "applicative"
    [ testGroup "17.9"
--      [ testCase "list" $ [(+ 1)] <*> [9] @=? [10]
--      ]
    ]
