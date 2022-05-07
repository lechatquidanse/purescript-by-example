module Chapter2
  ( circleArea
  , circleAreaComposed
  , diagonal
  )
  where

import Prelude

import Data.Number (pi, sqrt)


diagonal :: Number -> Number -> Number
diagonal w h = sqrt (w * w + h * h)


type Radius = Number
circleArea ∷ Radius → Number
circleArea r = r * r * pi



piTimes :: Number → Number
piTimes n = n * pi

square :: Number → Number
square n = n * n

circleAreaComposed ∷ Radius → Number
circleAreaComposed = piTimes <<< square