module Test.Chapter4Spec
  ( cartesianProductSpec
  , countEvenSpec
  , factorsSpec
  , isEvenSpec
  , isPrimeSpec
  , pythagoreanTripleSpec
  , removeNegativesSpec
  , removeNegativesWithInfixSpec
  , squaresSpec
  )
  where

import Prelude

import Chapter4.Chapter4 (cartesianProduct, countEven, factors, isEven, isPrime, pythagoreanTriple, removeNegatives, removeNegativesWithInfix, squares)
import Data.Tuple (Tuple(..))
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

squaresSpec ∷ Spec Unit
squaresSpec =
  describe "squaresSpec" do
    it "[2.0, 3.0, 5.0] squares compute to [4.0, 9.0, 25.0]" do
      squares [2.0, 3.0, 5.0] `shouldEqual` [4.0, 9.0, 25.0]
removeNegativesSpec ∷ Spec Unit
removeNegativesSpec =
  describe "removeNegatives" do
    it "[2.0, -3.0, 0.0, -12.0] squares compute to [2.0, 0.0]" do
      removeNegatives [2.0, -3.0, 0.0, -12.0] `shouldEqual` [2.0, 0.0]
removeNegativesWithInfixSpec ∷ Spec Unit
removeNegativesWithInfixSpec =
  describe "removeNegativesWithInfix" do
    it "[2.0, -3.0, 0.0, -12.0] squares compute to [2.0, 0.0]" do
      removeNegativesWithInfix [2.0, -3.0, 0.0, -12.0] `shouldEqual` [2.0, 0.0]
factorsSpec ∷ Spec Unit
factorsSpec =
  describe "factors" do
    it "350 factors are [[1,350],[2,175],[5,70],[7,50],[10,35],[14,25]" do
      factors 350 `shouldEqual` [[1,350],[2,175],[5,70],[7,50],[10,35],[14,25]]
isPrimeSpec ∷ Spec Unit
isPrimeSpec =
  describe "isPrime" do
    it "28 is not prime" do
      isPrime 28 `shouldEqual` false
    it "29 is prime" do
      isPrime 29 `shouldEqual` true
cartesianProductSpec ∷ Spec Unit
cartesianProductSpec =
  describe "cartesianProduct" do
    it "cartesianProduct of [1,2] and [4,5] is [[1,4],[1,5],[2,4],[2,5]]" do
      cartesianProduct [1,2] [4,5] `shouldEqual` [(Tuple 1 4),(Tuple 1 5),(Tuple 2 4),(Tuple 2 5)]
pythagoreanTripleSpec ∷ Spec Unit
pythagoreanTripleSpec =
  describe "pythagoreanTriple" do
    it "pythagoreanTriple 5 is [[3,4,5],[4,3,5]]" do
      pythagoreanTriple 5 `shouldEqual` [[3,4,5],[4,3,5]]