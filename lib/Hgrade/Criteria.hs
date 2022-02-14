{-|
    This module contains the list for all criteria
    and provides functions which return the criteria and the criteria html element
-}

module Hgrade.Criteria where

import Hgrade.HtmlGenerator as HG (input, label, break, th)  


-- |List of criteria
criteria :: [String]
criteria = ["N1", "N2", "F1", "F2", "F3"]

-- |Returns all criteria as html elements (for grading page)
getCriteriaGrading :: String
getCriteriaGrading = concatMap criteriaElementGrading criteria


-- |Returns html label, input and breakline for a particular criteria (for grading page)
criteriaElementGrading :: String -> String
criteriaElementGrading c = HG.label c ++ HG.input c ++ HG.break


-- |Returns all criteria as html elements (for evaluation page)
getCriteriaEva :: String
getCriteriaEva = concatMap criteriaElementEva criteria


-- |Returns html th (tablehead) for a particular criteria (for evaluation page)
criteriaElementEva :: String -> String
criteriaElementEva c = HG.th c


-- |Returns an empty th (used in evaluation page for proper layout)
emptyTh :: String
emptyTh = HG.th ""
