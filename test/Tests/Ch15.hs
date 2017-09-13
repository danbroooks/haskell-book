module Tests.Ch15 where

import Ch15
import Data.Monoid
import Test.Tasty (TestTree)
import Test.Tasty.HUnit

tests :: [ TestTree ]
tests =
  [ testCase "test1" $ Only (Sum 1) `mappend` Only (Sum 1)         @=? Only (Sum 2)
  , testCase "test2" $ Only (Product 4) `mappend` Only (Product 2) @=? Only (Product 8)
  , testCase "test3" $ Only (Sum 1) `mappend` Nada                 @=? Only (Sum 1)
  , testCase "test4" $ Only [1] `mappend` Nada                     @=? Only [1]
  , testCase "test5" $ Nada `mappend` Only (Sum 1)                 @=? Only (Sum 1)
  ]

