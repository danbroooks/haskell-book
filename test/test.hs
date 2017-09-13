module Main where

import Test.Tasty (TestTree, defaultMain, testGroup)
import qualified Tests.Ch15 as Ch15

tests :: [ TestTree ]
tests =
  [ testGroup "chapter 15" Ch15.tests ]

main :: IO ()
main =
  defaultMain $ testGroup "tests" tests
