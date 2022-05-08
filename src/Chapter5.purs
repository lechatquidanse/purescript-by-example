module Chapter5
  ( Point(..)
  , Shape(..)
  , area
  , circleOriginRadius10
  , extractText
  , factorial
  , fromSingleton
  , origin
  , pascalRule
  , sameCity
  , scaleBy2
  )
  where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Number (pi)

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

-- Exercice 5
data Point = Point
  { x :: Number
  , y :: Number
  }
data Shape
  = Circle Point Number
  | Rectangle Point Number Number
  | Line Point Point
  | Text Point String

origin :: Point
origin = Point { x, y }
  where
    x = 0.0
    y = 0.0
-- @todo missing tests
circleOriginRadius10 :: Shape
circleOriginRadius10 = Circle origin 10.0
-- @todo missing tests
scaleBy2 :: Shape -> Shape
scaleBy2 (Circle _ r) = Circle origin (r*2.0)
scaleBy2 (Rectangle _ w h) = Rectangle origin (w*2.0) (h*2.0)
scaleBy2 (Text _ s) = Text origin s
scaleBy2 line = line
-- @todo missing tests
extractText :: Shape -> Maybe String
extractText (Text _ string) = Just string
extractText _ = Nothing
-- @todo missing tests
area :: Shape -> Number
area (Circle _ r) = pi * r * r
area (Rectangle _ w h) = w * h
area _ = 0.0