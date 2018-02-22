module Tests.Ch26 where

import Tests.Ch26.MaybeT as MaybeT
import Test.Tasty (TestTree, testGroup)

tests :: TestTree
tests = testGroup "chapter 26" [ MaybeT.tests ]
