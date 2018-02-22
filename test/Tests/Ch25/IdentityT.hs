module Tests.Ch25.IdentityT where

import Test.Tasty (TestTree, testGroup)
import Test.Tasty.HUnit

import Ch25.IdentityT

tests :: TestTree
tests =
  testGroup "IdentityT examples"
    [ testCase "example" $
      1 @=? 1
    ]

