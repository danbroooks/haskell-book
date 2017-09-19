module Tests.Ch15.Semigroup where

import Data.Semigroup
import Test.Tasty (TestTree, testGroup)
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck

import Ch15.Semigroup
import Tests.Laws.Semigroup as S

type TrivialAssoc = Trivial
  -> Trivial
  -> Trivial
  -> Bool

instance Arbitrary Trivial where
  arbitrary = return Trivial

type IdentityAssoc = Identity Trivial
  -> Identity Trivial
  -> Identity Trivial
  -> Bool

instance Arbitrary a => Arbitrary (Identity a) where
  arbitrary = do
    a <- arbitrary
    return (Identity a)

type TwoAssoc = Two Trivial Trivial
  -> Two Trivial Trivial
  -> Two Trivial Trivial
  -> Bool

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    return (Two a b)

type ThreeAssoc = Three Trivial Trivial Trivial
  -> Three Trivial Trivial Trivial
  -> Three Trivial Trivial Trivial
  -> Bool

instance (Arbitrary a, Arbitrary b, Arbitrary c) => Arbitrary (Three a b c) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    c <- arbitrary
    return (Three a b c)

type FourAssoc = Four Trivial Trivial Trivial Trivial
  -> Four Trivial Trivial Trivial Trivial
  -> Four Trivial Trivial Trivial Trivial
  -> Bool

instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d) => Arbitrary (Four a b c d) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    c <- arbitrary
    d <- arbitrary
    return (Four a b c d)

type BoolConjAssoc = BoolConj -> BoolConj -> BoolConj -> Bool

instance Arbitrary BoolConj where
  arbitrary = frequency [ (1, return (BoolConj True))
                        , (1, return (BoolConj False)) ]

type BoolDisjAssoc = BoolDisj -> BoolDisj -> BoolDisj -> Bool

instance Arbitrary BoolDisj where
  arbitrary = frequency [ (1, return (BoolDisj True))
                        , (1, return (BoolDisj False)) ]

tests :: TestTree
tests = testGroup "semigroup" [
    testGroup "15.14" [
      testProperty "trivial semigroup obeys associativity"  $ (S.associativity :: TrivialAssoc)
    , testProperty "identity semigroup obeys associativity" $ (S.associativity :: IdentityAssoc)
    , testProperty "two semigroup obeys associativity"      $ (S.associativity :: TwoAssoc)
    , testProperty "three semigroup obeys associativity"    $ (S.associativity :: ThreeAssoc)
    , testProperty "four semigroup obeys associativity"     $ (S.associativity :: FourAssoc)
    , testGroup "boolconj" [
        testProperty "semigroup obeys associativity" $ (S.associativity :: BoolConjAssoc)
      , testCase "test 1" $ (BoolConj True) <> (BoolConj True) @=? (BoolConj True)
      , testCase "test 2" $ (BoolConj True) <> (BoolConj False) @=? (BoolConj False)
      ]
    , testGroup "booldisj" [
        testProperty "semigroup obeys associativity" $ (S.associativity :: BoolDisjAssoc)
      , testCase "test 1" $ (BoolDisj True) <> (BoolDisj True) @=? (BoolDisj True)
      , testCase "test 2" $ (BoolDisj True) <> (BoolDisj False) @=? (BoolDisj True)
      ]
    ]
  ]

