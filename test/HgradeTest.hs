{-|
    This module contains all Unit tests
-}
module Main (main) where

import Test.Tasty
import Test.Tasty.HUnit
import qualified Evaluation



main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Tests" [medianUnitTest, colsToRowUnitTest, histogramUnitTest]

-- |Unit test for calculating a median
medianUnitTest :: TestTree
medianUnitTest = testGroup "median"
  [ testCase "even unsorted list" $
      Evaluation.median [3,0,4,2,6,7] @?= 3.5,

    testCase "odd unsorted list" $
      Evaluation.median [2,5,1,0,8] @?= 2
 
  ]


-- |Unit test for colsToRow-Function
colsToRowUnitTest :: TestTree
colsToRowUnitTest = testGroup "colsToRow"
  [ testCase "colsToRow-Test 1" $
      Evaluation.colsToRows [ [1,2,3], [1,2,3], [1,2,3] ] @?= [ [1,1,1], [2,2,2], [3,3,3] ],
      
    testCase "colsToRow-Test 2" $
      Evaluation.colsToRows [ [2,5,4,6], [3,1,7,9] ] @?= [ [2,3], [5,1], [4,7], [6,9] ]
      
 
  ]
  

-- |Unit test for calculating a histogram
histogramUnitTest :: TestTree
histogramUnitTest = testGroup "histogram"
  [ testCase "histogram test with multiple Ints in list" $
      Evaluation.histogram [0, 1, 2 ,0, 0 ,0, 2] @?= (4, 1, 2),
    testCase "histogram test with only one Int in list" $
      Evaluation.histogram [2] @?= (0, 0, 1)

  ]

