{-|
    This module contains the evaluation page
    and provides all necessary functions to build the evaluation table
-}

module Evaluation where

import Web.Scotty  
import qualified    Data.Text.Lazy as T
import qualified    Hgrade.HtmlGenerator as HG ( html, body, h1, table, tr, td)
import           Control.Monad.IO.Class (liftIO)
import qualified Data.Char
import qualified Data.List
import qualified Hgrade.Criteria as Criteria


-- |Generates the evaluation page for a particular author
evaluation :: String -> [String] -> ActionM ()
evaluation author graders = do
    -- Get authors path
    let authorPath = "data/" ++ author ++ "/"
    -- Store grades from all files
    allGradeFiles <- mapM (\gradeFile -> liftIO(readFile(authorPath ++ gradeFile))) graders
    -- Reads all data out
    let allGrades = getAllGrades (reverse graders) (reverse allGradeFiles)
    -- Calculate medians
    let allMedians = map median (gradesList allGradeFiles)
    Web.Scotty.html(
        T.pack(
            HG.html(
                HG.body (
                    HG.h1 ("Author: " ++ author)++
                    HG.table (
                        HG.tr(
                            Criteria.emptyTh++
                            Criteria.getCriteriaEva
                        )++
                        createEntries allGrades (gradesList allGradeFiles)++
                        medianRow allMedians++
                        histoRow
                    )
                )
            )
        )
        )

-- |Converts all grades to int-lists
gradesList :: [String] -> [[Int]]
gradesList allGradeFiles = colsToRows (map charToInt allGradeFiles)

-- |Converting the string data to Int
charToInt :: [Char] -> [Int]
charToInt x = map Data.Char.digitToInt (filter Data.Char.isDigit x)

-- |Gets the values for a criterion
colsToRows :: [[a]] -> [[a]]
colsToRows [[]] = []
colsToRows ([]:_) = []
colsToRows gradesList = map head gradesList : colsToRows (map (tail) (gradesList))

-- |Reads all data out
getAllGrades :: [String] -> [String] -> [String]
getAllGrades graders files = getAllGrades' [] graders files
  where getAllGrades' grader [] [] = grader
        getAllGrades' grader [] (_:_) = grader
        getAllGrades' grader (_:_) [] = grader
        getAllGrades' grader (g:gs) (f:fs) = getAllGrades' (grader ++ ([takeWhile  (/= '.') g] ++ [f])) gs fs

-- |Creates an entry in the table for each grade
createEntries :: [String] -> [[Int]] -> String
createEntries allGrades gradesList = createEntries' "" allGrades
    where createEntries' allGrades [] = allGrades ++ ""
          createEntries' allGrades [_] = allGrades ++ ""
          createEntries' allGrades (x:x2:xs) = createEntries' (allGrades ++ HG.tr (graderRow x x2)) xs

-- |Creates a row for a grader in the table
graderRow :: String -> String -> String
graderRow grader gradesList = graderRow' (HG.td grader) (charToInt gradesList)
    where graderRow' grader [] = grader
          graderRow' grader [g] = grader ++ HG.td (show g)
          graderRow' grader (g:gs) = graderRow' (grader ++ HG.td (show g)) gs

-- |Creates a row for all medians in the table 
medianRow :: [Double] -> String
medianRow = medianRow' (HG.td "Median")
    where medianRow' median [] = median
          medianRow' median [m] = median ++ HG.td (show m)
          medianRow' median (m:ms) = medianRow'(median ++ HG.td (show m)) ms

-- |Main function to calculate a median
median :: [Int] -> Double
median grades | even  (getLength grades) = (getEvenMidElement grades + getMidElement grades) / 2
          | otherwise = getMidElement grades

-- |Returns the length of a list
getLength :: [a] -> Int
getLength list = length list

-- |Returns the middle of an odd list as Int
getMid :: [a] -> Int
getMid list = fromIntegral (quot (getLength list) 2)

-- |Returns the element in the middle of an odd int-list
getMidElement :: [Int] -> Double
getMidElement grades = fromIntegral (Data.List.sort grades !! getMid grades)

-- |Returns the middle of an even list as Int
getEvenMid :: [a] -> Int
getEvenMid list = fromIntegral (quot (getLength list) 2 -1)

-- |Returns the element in the middle of an even int-list
getEvenMidElement :: [Int] -> Double
getEvenMidElement grades = fromIntegral (Data.List.sort grades !! getEvenMid grades)

-- |Yet empty table row for the histograms
histoRow :: String
histoRow = HG.tr (
        HG.td "Histograms"++
        HG.td ""++
        HG.td ""++
        HG.td ""++
        HG.td ""++
        HG.td ""
    )


-- |Main function to calculate histogram
histogram :: [Int] -> (Int, Int, Int)
histogram list = (count 0 list, count 1 list, count 2 list)


-- |Returns how many times an Int appears in a list of Ints
count :: Int -> [Int] -> Int
count _ [] = 0
count elem list = length (filter (==elem) list) 

