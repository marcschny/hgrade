{-|
    This module contains the index page
-}

module Index where


import           Web.Scotty
import Hgrade.HtmlGenerator as HG ( html, body, h1, a, ul, li)  
import qualified Data.Text.Lazy as T   


-- |Generates the index page
index :: ActionM()
index = Web.Scotty.html(
        T.pack (
            HG.html (
                HG.body (
                    HG.h1 
                        "HGrade - Peergrading in Haskell" 
                    ++ 
                    HG.ul (
                        HG.li (
                            HG.a "authors" "Grading Overview"
                        )
                    )
                    ++ 
                    HG.ul (
                        HG.li (
                            HG.a "grade" "Submit Grading"
                        )
                    )
                )
            )
        )
    )