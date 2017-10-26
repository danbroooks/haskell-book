module Tests.Ch15 where

import Tests.Ch15.Monoid as Monoid
import Tests.Ch15.Semigroup as Semigroup
import Test.Tasty (TestTree, testGroup)

tests :: TestTree
tests = testGroup "chapter 15" [ Monoid.tests, Semigroup.tests ]
