{-|
    This module contains the the grading page
    and provides a function which puts all inputs in a list of Ints
-}

module Grade where

import           Web.Scotty
import Hgrade.HtmlGenerator as HG ( html, body, h1, form, input, label, break, submit)  
import qualified Data.Text.Lazy as T  
import qualified Hgrade.Criteria as Criteria

-- |Generates the grading page
grade :: ActionM()
grade = Web.Scotty.html(
        T.pack(
            HG.html (
                HG.body(
                    HG.h1
                        "Grade"
                    ++
                    HG.form(
                        HG.label "Author"++
                        HG.input "Author"++
                        HG.break++
                        HG.label "Grader"++
                        HG.input "Grader"++
                        HG.break++
                        Criteria.getCriteriaGrading++
                        HG.submit "Send"
                    )
                )
            )
        )
    )


-- |Puts all inputs in an Int-list
inputList :: [Param] -> [Int]
inputList inputs = inputList' [] (drop 2 inputs)
    where inputList' p [] = p
          inputList' p [i] = p ++ [read (T.unpack (snd i)) :: Int]
          inputList' p (i:is) = inputList' (p ++ [read (T.unpack (snd i)) :: Int] ) is

