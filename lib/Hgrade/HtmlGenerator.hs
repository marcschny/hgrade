{-|
    This module contains all html tags used in this project
-}

module Hgrade.HtmlGenerator where



-- |Starting tag
startTag :: String -> String
startTag el = "<" ++ el ++">"

-- |ending tag
endTag :: String -> String
endTag el = "</" ++ el ++ ">"

-- |html tag
html :: String -> String
html el = startTag "html lang='en'" ++ el ++ endTag "html"

-- |head tag
head :: String -> String
head el = startTag "head" ++ el ++ endTag "head"

-- |body tag
body :: String -> String
body el = startTag "body" ++ el ++ endTag "body"

-- |h1 tag
h1 :: String -> String
h1 el = startTag "h1" ++ el ++ endTag "h1"

-- |a tag (link tag)
a :: String -> String -> String
a link el = startTag ("a href='" ++ link ++"'") ++ el ++ endTag "a"

-- |ul tag (unordered list tag)
ul :: String -> String
ul el = startTag "ul" ++ el ++ endTag "ul"

-- |li tag (list elent tag)
li :: String -> String
li el = startTag "li" ++ el ++ endTag "li"

-- |form tag
form :: String -> String
form el = startTag "form action='/grade' method='post'" ++ el ++ endTag "form"

-- |input tag (text inputs)
input :: String -> String
input el = startTag ("input type='text' name="++el++"")

-- |label tag
label :: String -> String
label el = startTag ("label for="++el++"") ++ el ++ ": " ++ endTag "label"

-- |breakline tag
break :: String
break = startTag "br"

-- |input tag (submit)
submit :: String -> String
submit el = startTag ("input type='submit' value=" ++ el ++ "")

-- |table tag
table :: String -> String
table el = startTag "table border='1px solid black'" ++ el ++ endTag "table"

-- |th tag (table head)
th :: String -> String
th el = startTag "th" ++ el ++ endTag "th"

-- |tr tag (table row)
tr :: String -> String
tr el = startTag "tr" ++ el ++ endTag "tr"

-- |td tag (table data)
td :: String -> String
td el = startTag "td" ++ el ++ endTag "td"
