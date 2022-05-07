module Test.Chapter2
  ( circleAreaComposedSpec
  , circleAreaSpec
  , diagonalSpec
  )
  where

import Prelude

import Chapter2 (circleArea, circleAreaComposed, diagonal)
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.QuickCheck (quickCheck)


diagonalSpec ∷ Spec Unit
diagonalSpec =
  describe "diagonal" do
    it "given 3.0 and 4.0, diagonal compute 5.0" do
      diagonal 3.0 4.0 `shouldEqual` 5.0
    it "given generative values, diagonal is associative" $
      quickCheck \ n m -> diagonal n m == diagonal m n

circleAreaSpec ∷ Spec Unit
circleAreaSpec = 
  describe "circleArea" do
    it "given radius 3.1, circleArea compute 30.190705400997917" do
      circleArea 3.1 `shouldEqual` 30.190705400997917

circleAreaComposedSpec ∷ Spec Unit
circleAreaComposedSpec = 
  describe "circleAreaComposed" do
    it "given radius 3.1, circleAreaComposed compute 30.190705400997917" do
      circleAreaComposed 3.1 `shouldEqual` 30.190705400997917
