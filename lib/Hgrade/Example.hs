module HGrade.Example where

-- |Nur hier um zu testen :)
unlines' :: [String] -> String
unlines' [] = ""
unlines' [s] = s
unlines' (s:s':ss) = s  ++ "\n" ++ unlines' (s':ss)  