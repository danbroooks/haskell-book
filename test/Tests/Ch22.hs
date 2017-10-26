module Tests.Ch22 where

import Tests.Ch22.Reader as Reader
import Test.Tasty (TestTree, testGroup)

tests :: TestTree
tests = testGroup "chapter 22" [ Reader.tests ]
