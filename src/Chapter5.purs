module Chapter5
  ( factorial
  , fromSingleton
  , pascalRule
  , sameCity
  )
  where

import Prelude

-- Exercice 1
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n -1)

-- Exercice 2 N_{x,y}=N_{x-1,y}+N_{x,y-1} and N_{0,y}=N_{x,0}=1
pascalRule :: Int -> Int -> Int
pascalRule 0 _ = 1
pascalRule _ 0 = 1
pascalRule x y = pascalRule (x-1) y + pascalRule x (y-1)

-- Exercice 3
type Address = { street :: String, city :: String }
type Person = { name :: String, address :: Address }
sameCity :: Person -> Person -> Boolean
sameCity { address: { city: x } } { address: { city: y } } = x == y

-- Exercice 4
fromSingleton :: forall a. a -> Array a -> a
fromSingleton _ [x] = x
fromSingleton x _ = x