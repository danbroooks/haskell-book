module Tests.Ch17 where

import Tests.Ch17.Applicative as Applicative
import Test.Tasty (TestTree, testGroup)

tests :: TestTree
tests = testGroup "chapter 17" [ Applicative.tests ]
