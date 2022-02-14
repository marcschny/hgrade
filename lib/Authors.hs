{-|
    This module contains the authors overview page
    and provides a function which returns a html-link for an author
-}

module Authors where

import           Web.Scotty
import Hgrade.HtmlGenerator as HG ( html, body, h1, a, ul, li)  
import qualified Data.Text.Lazy as T   


-- |Generates the authors overview page
authors :: [String] -> ActionM () 
authors allAuthors = Web.Scotty.html (
        T.pack (
            HG.html(
                HG.body (
                    HG.h1 "Authors"
                    ++
                    HG.ul (
                        concatMap authorElement (reverse allAuthors)
                    )
                )
            )
        )
    )


-- |Returns a html-link for an author
authorElement :: String -> String
authorElement author = HG.li (
        HG.a ("/authors/"++author) author
    )
