module Test.Chapter5Spec
  ( factorialSpec
  , fromSingletonSpec
  , sameCitySpec
  )
  where

import Prelude

import Chapter5 (factorial, fromSingleton, sameCity)
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)


factorialSpec ∷ Spec Unit
factorialSpec =
  describe "factorial" do
    it "factorial 5 is 120" do
      factorial 5 `shouldEqual` 120

sameCitySpec ∷ Spec Unit
sameCitySpec =
  describe "sameCity" do
    it "return false when not same city" do
      sameCity 
        { name: "john", address: {street: "", city: "New York"}} 
        { name: "eva", address: {street: "", city: "Paris"}} 
        `shouldEqual` false
    it "return true when same city" do
      sameCity 
        { name: "john", address: {street: "", city: "Paris"}} 
        { name: "eva", address: {street: "", city: "Paris"}} 
        `shouldEqual` true
fromSingletonSpec ∷ Spec Unit
fromSingletonSpec =
  describe "fromSingleton" do
    it "return default when not singleton" do
      fromSingleton 2 [45, 32] `shouldEqual` 2
    it "return singleton when singleton" do
      fromSingleton 2 [45] `shouldEqual` 45
