module Test.Chapter3
  ( containsNameSpec
  , findEntryBySpec
  , findEntrySpec
  , insertEntrySpec
  , removeDuplicatesSpec
  , showEntrySpec
  )
  where

import Prelude

import Chapter3 (FindByCriteria(..), containsName, emptyBook, findEntry, findEntryBy, insertEntry, removeDuplicates, showEntry)
import Data.List (List(..))
import Data.Maybe (Maybe(..))
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)


showEntrySpec ∷ Spec Unit
showEntrySpec =
  describe "showEntry" do
    it "can show entry" do
      showEntry { 
        firstName: "John", 
        lastName: "Smith", 
        address: { street: "123 Fake St.", city: "Faketown", state: "CA" } 
      } `shouldEqual` "Smith, John: 123 Fake St. Faketown CA"

insertEntrySpec ∷ Spec Unit
insertEntrySpec =
  describe "insertEntry" do
    it "can insert entry" do
      insertEntry { 
        firstName: "John", 
        lastName: "Smith", 
        address: { street: "123 Fake St.", city: "Faketown", state: "CA" } 
      } emptyBook `shouldEqual` Cons { 
        firstName: "John", 
        lastName: "Smith", 
        address: { street: "123 Fake St.", city: "Faketown", state: "CA" } 
      }  Nil

findEntrySpec ∷ Spec Unit
findEntrySpec =
  describe "findEntrySpec" do
    it "can find entry" do
      findEntry "John" "Smith" (
        Cons { 
        firstName: "Eva", 
        lastName: "Jolie", 
        address: { street: "1 St.", city: "Town", state: "TX" } 
        } $
        Cons { 
        firstName: "John", 
        lastName: "Smith", 
        address: { street: "123 Fake St.", city: "Faketown", state: "CA" } 
        } $
         Nil
      ) `shouldEqual` Just { 
        firstName: "John", 
        lastName: "Smith", 
        address: { street: "123 Fake St.", city: "Faketown", state: "CA" } 
      }

findEntryBySpec ∷ Spec Unit
findEntryBySpec =
  describe "findEntryBy" do
    it "can find entry by firstName and lastName" do
      findEntryBy (ByName "John" "Smith") (
        Cons { 
        firstName: "Eva", 
        lastName: "Jolie", 
        address: { street: "1 St.", city: "Town", state: "TX" } 
        } $
        Cons { 
        firstName: "John", 
        lastName: "Smith", 
        address: { street: "123 Fake St.", city: "Faketown", state: "CA" } 
        } $
         Nil
      ) `shouldEqual` Just { 
        firstName: "John", 
        lastName: "Smith", 
        address: { street: "123 Fake St.", city: "Faketown", state: "CA" } 
      }
    it "can find entry by street" do
      findEntryBy (ByAddressStreet "1 St.") (
        Cons { 
        firstName: "Eva", 
        lastName: "Jolie", 
        address: { street: "1 St.", city: "Town", state: "TX" } 
        } $
        Cons { 
        firstName: "John", 
        lastName: "Smith", 
        address: { street: "123 Fake St.", city: "Faketown", state: "CA" } 
        } $
         Nil
      ) `shouldEqual` Just { 
        firstName: "Eva", 
        lastName: "Jolie", 
        address: { street: "1 St.", city: "Town", state: "TX" } 
        }
containsNameSpec ∷ Spec Unit
containsNameSpec =
  describe "containsName" do
    it "does not contain when name is not in book" do
      containsName "John" "Smith" (
        Cons { 
        firstName: "Eva", 
        lastName: "Jolie", 
        address: { street: "1 St.", city: "Town", state: "TX" } 
        } $
         Nil
      ) `shouldEqual` false
    it "does not contain when name is not in book" do
      containsName "John" "Smith" (
        Cons { 
        firstName: "John", 
        lastName: "Smith", 
        address: { street: "123 Fake St.", city: "Faketown", state: "CA" } 
        } $
         Nil
      ) `shouldEqual` true

removeDuplicatesSpec ∷ Spec Unit
removeDuplicatesSpec =
  describe "removeDuplicates" do
    it "remove duplicate" do 
      removeDuplicates (
        Cons { 
        firstName: "John", 
        lastName: "Smith", 
        address: { street: "1 St.", city: "Town", state: "TX" } 
        } $
        Cons { 
        firstName: "John", 
        lastName: "Smith", 
        address: { street: "123 Fake St.", city: "Faketown", state: "CA" } 
        } $
         Nil
      ) `shouldEqual` (
        Cons { 
        firstName: "John", 
        lastName: "Smith", 
        address: { street: "1 St.", city: "Town", state: "TX" } 
        } $
         Nil
      ) 
