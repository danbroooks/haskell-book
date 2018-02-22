module Tests.Ch26.MaybeT where

import Test.Tasty (TestTree, testGroup)
import Test.Tasty.HUnit

import Ch26.MaybeT

tests :: TestTree
tests =
  testGroup "monad transformers"
    [ testGroup "MaybeT examples"
      [ testCase "example" $
        1 @=? 1
      ]
    ]

