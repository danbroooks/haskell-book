module Tests.Ch15.Monoid where

import Data.Monoid
import Test.Tasty (TestTree, testGroup)
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck

import Ch15.Monoid
import Tests.Laws.Monoid as M

instance Arbitrary a => Arbitrary (First' a) where
  arbitrary = do
    x <- arbitrary
    frequency [ (1, return (First' (Only x)))
              , (1, return (First' Nada))]

tests :: TestTree
tests = testGroup "monoid" [
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
    ],
    testGroup "15.12" [
      testProperty "obeys associativity law" (M.associativity :: FirstMappend)
    , testProperty "obeys right identity law" (M.rightIdentity :: First' String -> Bool)
    , testProperty "obeys right identity law" (M.leftIdentity :: First' String -> Bool)
    , testCase "test 1" $ First' (Only 1) `mappend` First' Nada      @=? First' (Only 1)
    , testCase "test 2" $ First' Nada `mappend` First' Nada          @=? First' (Nada :: Optional Int)
    , testCase "test 3" $ First' Nada `mappend` First' (Only 2)      @=? First' (Only 2)
    , testCase "test 4" $ First' (Only 1) `mappend` First' (Only 2)  @=? First' (Only 1)
    ]
  ]

