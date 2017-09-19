module Main where

import Test.Tasty (defaultMain, testGroup)
import qualified Tests.Ch15 as Ch15

main :: IO ()
main = defaultMain $ testGroup "tests" [ Ch15.tests ]
