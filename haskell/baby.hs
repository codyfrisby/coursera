{-
 This is a
 multi line comment
-}
import Data.List
import System.IO

doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y
doubleSmallNumber x = if x > 100
                        then x
                        else x*2
-- This is a comment. 			
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1


-- Some notes
-- Int -2^63 and 2^63
minInt = minBound :: Int
maxInt = maxBound :: Int

-- More notes from Learn You Haskell book
outer x y = [x*y | x <- x, y <- y]
length' xs = sum [1 | _ <- xs] -- Length of a list :)

-- [x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]

removeNonUpperase st = [ c | c <- st, c `elem` ['A'..'Z']]

