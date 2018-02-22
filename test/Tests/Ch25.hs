module Tests.Ch25 where

import Tests.Ch25.IdentityT as IdentityT
import Tests.Ch25.Compose as Compose
import Test.Tasty (TestTree, testGroup)

tests :: TestTree
tests =
  testGroup "chapter 25" tests
  where tests = [ IdentityT.tests
                , Compose.tests
                ]
