{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Course.ComonadTest where


import           Test.Mini         (MiniTestTree, Tester (..), UnitTester (..),
                                    courseTest)

import           Course.Comonad    (copure, (<$$>))
import           Course.Core
import           Course.ExactlyOne (ExactlyOne (..))

test_Comonad :: MiniTestTree
test_Comonad =
  testGroup "Comonad" [
    exactlyOneTest
  , fmapTest
  ]

exactlyOneTest :: MiniTestTree
exactlyOneTest =
  testCase "ExactlyOne" $ copure (ExactlyOne 7) @?= 7

fmapTest :: MiniTestTree
fmapTest =
  testCase "<$$>" $
    ((+10) <$$> ExactlyOne 7) @?= ExactlyOne 17
