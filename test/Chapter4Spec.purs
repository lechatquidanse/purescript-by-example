module Test.Chapter4Spec
  ( countEvenSpec
  , isEvenSpec
  )
  where

import Prelude

import Chapter4.Chapter4 (countEven, isEven)
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)


isEvenSpec ∷ Spec Unit
isEvenSpec =
  describe "isEven" do
    it "24 is even" do
      isEven 24 `shouldEqual` true
    it "13 is not even" do
      isEven 13 `shouldEqual` false

countEvenSpec ∷ Spec Unit
countEvenSpec =
  describe "countEven" do
    it "[2, 3, 5, 8] count 2 even" do
      countEven [2, 3, 5, 8] `shouldEqual` 2
