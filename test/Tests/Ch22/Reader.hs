module Tests.Ch22.Reader where

import Ch22.Reader
import Test.Tasty (TestTree, testGroup)
import Test.Tasty.HUnit

tests :: TestTree
tests = testGroup "reader" [
    testGroup "22.2" [
      testCase "composed" $ composed "Dan" @=? "NAD"
    , testCase "composed" $ composed "Julie" @=? "EILUJ"
    , testCase "fmapped"  $ fmapped "Dan" @=? "NAD"
    , testCase "fmapped"  $ fmapped "Chris" @=? "SIRHC"
    , testCase "tupled"   $ tupled "Dan" @=? ("DAN", "naD")
    , testCase "tupled"   $ tupled "Julie" @=? ("JULIE", "eiluJ")
    , testCase "tupled"   $ tupled "Chris" @=? ("CHRIS", "sirhC")
    , testCase "explicitlyTupled"  $ explicitlyTupled "Dan" @=? ("DAN", "naD")
    , testCase "monadicallyTupled" $ monadicallyTupled "Dan" @=? ("DAN", "naD")
    , testCase "doBlockTupled"     $ explicitlyTupled "Dan" @=? ("DAN", "naD")
    ]
  , testGroup "22.5" [
      testCase "runReader" $ runReader (Reader (*)) 2 5 @=? 10
    , testCase "ask" $ runReader ask 10 @=? 10
    ]
  , testGroup "22.6" [
      testCase "liftA2"  $ dogName (liftA2 Dog dog personName $ Person "Chris" "Austin" "Fido") @=? "Fido"
    , testCase "asks"    $ (runReader $ asks (+2)) 8 @=? 10
    , testCase "getDogR" $ dogName (runReader getDogR $ Person "Chris" "Austin" "Fido") @=? "Fido"
    ]
  ]
