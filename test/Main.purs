module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Aff (launchAff_)
import Test.Chapter2 (circleAreaComposedSpec, circleAreaSpec, diagonalSpec)
import Test.Chapter3 (containsNameSpec, findEntryBySpec, findEntrySpec, insertEntrySpec, removeDuplicatesSpec, showEntrySpec)
import Test.Chapter4Spec (areTrueSpec, cartesianProductSpec, countEvenSpec, factorsSpec, isEvenSpec, isPrimeSpec, pythagoreanTripleSpec, removeNegativesSpec, removeNegativesWithInfixSpec, squaresSpec)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner (runSpec)


main ∷ Effect Unit
main = do
  launchAff_ $ runSpec [consoleReporter] do
    -- Chapter 2
    diagonalSpec
    circleAreaSpec
    circleAreaComposedSpec
    -- Chapter 3
    showEntrySpec
    insertEntrySpec
    findEntrySpec
    findEntryBySpec
    containsNameSpec
    removeDuplicatesSpec
    -- Chapter 4
    isEvenSpec
    countEvenSpec
    squaresSpec
    removeNegativesSpec
    removeNegativesWithInfixSpec
    factorsSpec
    isPrimeSpec
    cartesianProductSpec
    pythagoreanTripleSpec
    areTrueSpec