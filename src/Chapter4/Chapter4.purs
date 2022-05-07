module Chapter4.Chapter4
  ( booleanToNumber
  , countEven
  , isEven
  )
  where

import Prelude

import Data.Array.Partial (tail, head)
import Partial.Unsafe (unsafePartial)

-- Exercice 1
isEven :: Int -> Boolean
isEven 0 = true
isEven 1 = false 
isEven n = isEven $ n -2
booleanToNumber :: Boolean -> Int
booleanToNumber true = 1
booleanToNumber false = 0
isFirstElementEvenAsNumber :: Array Int -> Int
isFirstElementEvenAsNumber arr = unsafePartial head arr
                                 # isEven
                                 # booleanToNumber

-- Exercice 2
countEven :: Array Int -> Int
countEven []  = 0
countEven arr = isFirstElementEvenAsNumber arr + countEven (unsafePartial tail arr)
              
