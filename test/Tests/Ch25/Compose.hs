module Tests.Ch25.Compose where

import Test.Tasty (TestTree, testGroup)
import Test.Tasty.HUnit

import Ch25.Compose

tests :: TestTree
tests =
  testGroup "Compose examples"
    [ testCase "getCompose extracts the compose value" $
      (getCompose $ Compose [ Just 1, Nothing ]) @=? [ Just 1, Nothing ]
    , testCase "" $
      getCompose (Compose $ Just (Just 1)) @=? Just (Just 1)
    ]

