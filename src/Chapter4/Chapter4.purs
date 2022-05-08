module Chapter4.Chapter4
  ( booleanToNumber
  , cartesianProduct
  , countEven
  , factors
  , isEven
  , isPrime
  , pythagoreanTriple
  , removeNegatives
  , removeNegativesWithInfix
  , squares
  )
  where

import Prelude

import Control.Alternative (guard)
import Data.Array (filter, length, (..))
import Data.Array.Partial (tail, head)
import Data.Tuple (Tuple(..))
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
              
-- Exercice 3
square :: Number -> Number
square x = x * x
squares :: Array Number -> Array Number
squares = map square

-- Exercice 4
isPostive :: Number -> Boolean
isPostive n = n >= 0.0
removeNegatives :: Array Number -> Array Number
removeNegatives arr = filter isPostive arr 

-- Exercice 5
infix 1 filter as <$?>
removeNegativesWithInfix :: Array Number -> Array Number
removeNegativesWithInfix arr = isPostive <$?> arr 

-- Exercice 6
factors :: Int -> Array (Array Int)
factors n =  do
  i <- 1 .. n
  j <- i .. n
  guard $ i * j == n
  pure [i, j]

isPrime :: Int -> Boolean
isPrime n = factors n
        # length
        # eq 1

-- Exercice 7
cartesianProduct :: forall a b. Array a -> Array b -> Array (Tuple a b)
cartesianProduct xs ys = do
  i <- xs
  j <- ys
  [Tuple i j]   

-- Exercice 8
pythagoreanTriple :: Int -> Array (Array Int)
pythagoreanTriple n = do
  a <- 1..n
  b <- 1..n
  c <- 1..n
  guard $ a*a + b*b == c*c
  pure [a,b,c]

-- Exercice 9 factorizations :: Int -> [[Int]]
