module Test where

import Test.Tasty (defaultMain, testGroup)
import qualified Tests.Ch15 as Ch15
import qualified Tests.Ch22 as Ch22
import qualified Tests.Ch25 as Ch25

main :: IO ()
main =
  defaultMain $ testGroup "tests" tests
  where tests = [ Ch15.tests
                , Ch22.tests
                , Ch25.tests
                ]
