{-# LANGUAGE OverloadedStrings #-}

{-|
    This module contains all routes and related functions to navigate in the hgrade app
    All HTTP-Request (Gets and Posts) can be found in this module
-}

module Hgrade where

import           Web.Scotty
import           Control.Monad.IO.Class (liftIO)
import           Network.Wai.Middleware.RequestLogger ( logStdoutDev )
import qualified Data.Text.Lazy as T
import System.Directory ( listDirectory, createDirectoryIfMissing )
import Index as Index
import Authors as Authors
import Grade as Grade
import Evaluation as Evaluation


-- |Main function to run project
main :: IO ()
main = do
  putStrLn "Good Luck!"
  scotty 4000 $ do
    middleware logStdoutDev

    -- Navigates to index page
    get "/"  $ Index.index


    -- Opens the authors overview page and lists all directories in folder "data"
    get "/authors" $ do
      allAuthors <- liftIO (listDirectory "data")
      Authors.authors allAuthors


    -- Opens the grading page
    get "/grade" $ Grade.grade


    -- Opens the evaluation page for the particular author
    get "/authors/:author" $ do
      author <- param "author"
      graders <- liftIO (listDirectory ("data/"++author))
      Evaluation.evaluation author graders

    -- Reads the input values from the grading page and writes them to a file
    post "/grade" $ do
      inputParams <- params
      let dataPath = "data/"
      let author = T.unpack (snd (head inputParams))
      let grader = T.unpack (snd (inputParams !! 1))
      let gradeList = Grade.inputList inputParams
      -- create parent directory (data) if missing
      -- Create directory if missing
      liftIO (createDirectoryIfMissing True (dataPath ++ author))
      -- Write grades into a file
      liftIO (writeFile (dataPath ++ author ++ "/" ++  grader ++ ".txt") (show gradeList))
      -- Finally redirect to the authors overview page
      redirect "/authors"
    
    -- Get css-file
    get "/static/styles.css" $ file "static/styles.css"


