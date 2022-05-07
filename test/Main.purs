module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Aff (launchAff_)
import Test.Chapter2 (circleAreaComposedSpecTesting, circleAreaSpecTesting, diagonalSpecTesting)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner (runSpec)


main ∷ Effect Unit
main = do
  launchAff_ $ runSpec [consoleReporter] do
    diagonalSpecTesting
    circleAreaSpecTesting
    circleAreaComposedSpecTesting