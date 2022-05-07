module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Aff (launchAff_)
import Test.Chapter2 (circleAreaComposedSpec, circleAreaSpec, diagonalSpec)
import Test.Chapter3 (containsNameSpec, findEntryBySpec, findEntrySpec, insertEntrySpec, removeDuplicatesSpec, showEntrySpec)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner (runSpec)


main ∷ Effect Unit
main = do
  launchAff_ $ runSpec [consoleReporter] do
    -- Chapter 1
    diagonalSpec
    circleAreaSpec
    circleAreaComposedSpec
    -- Chapter 2
    showEntrySpec
    insertEntrySpec
    findEntrySpec
    findEntryBySpec
    containsNameSpec
    removeDuplicatesSpec