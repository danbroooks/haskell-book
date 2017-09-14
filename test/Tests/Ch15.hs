module Tests.Ch15 where

import Ch15
import Data.Monoid
import Test.Tasty (TestTree, testGroup)
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck

tests :: [ TestTree ]
tests = [
    testGroup "15.10" [
      testCase "test1" $ Only (Sum 1) `mappend` Only (Sum 1)         @=? Only (Sum 2)
    , testCase "test2" $ Only (Product 4) `mappend` Only (Product 2) @=? Only (Product 8)
    , testCase "test3" $ Only (Sum 1) `mappend` Nada                 @=? Only (Sum 1)
    , testCase "test4" $ Only [1] `mappend` Nada                     @=? Only [1]
    , testCase "test5" $ Nada `mappend` Only (Sum 1)                 @=? Only (Sum 1)
    ],
    testGroup "15.11" [
      testCase "madlibbin'" $
        madlibbin' "Wow" "loudly" "seat" "second" @=?
          "Wow! he said loudly as he jumped into his car seat and drove off with his second wife."
      ,

      testCase "madlibbinBetter'" $
        madlibbinBetter' "Wow" "loudly" "seat" "second" @=?
          "Wow! he said loudly as he jumped into his car seat and drove off with his second wife."
      ,

      testProperty "madlibbin' == madlibbinBetter'" $
        \e adv noun adj -> (madlibbin' e adv noun adj) == (madlibbinBetter' e adv noun adj)
    ]
  ]

