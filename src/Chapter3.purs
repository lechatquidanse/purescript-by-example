module Chapter3
  ( AddressStreet
  , FindByCriteria(..)
  , FirstName
  , LastName
  , containsName
  , emptyBook
  , findEntry
  , findEntryBy
  , insertEntry
  , removeDuplicates
  , showEntry
  )
  where

import Prelude

import Control.Plus (empty)
import Data.List (List(..), filter, head, null, nubBy)
import Data.Maybe (Maybe)

type Address =
  { street :: String
  , city   :: String
  , state  :: String
  }

type Entry =
  { firstName :: String
  , lastName  :: String
  , address   :: Address
  }

type AddressBook = List Entry


showAddress :: Address -> String
showAddress address = address.street <> " " <> address.city <> " " <> address.state

showEntry :: Entry -> String
showEntry entry = entry.lastName <> ", " <>
                  entry.firstName <> ": " <>
                  showAddress entry.address

emptyBook :: AddressBook
emptyBook = empty

insertEntry :: Entry -> AddressBook -> AddressBook
insertEntry = Cons

findEntry :: String -> String -> AddressBook -> Maybe Entry
findEntry firstName lastName = filter filterEntry >>> head
  where
    filterEntry :: Entry -> Boolean
    filterEntry entry = entry.firstName == firstName && entry.lastName == lastName

-- Exercice 2
type FirstName = String
type LastName = String
type AddressStreet = String

data FindByCriteria
    = ByName FirstName LastName
    | ByAddressStreet AddressStreet
sameName :: FirstName -> LastName -> Entry -> Boolean
sameName f l e = e.firstName == f && e.lastName == l
sameAddressStreet :: AddressStreet -> Entry -> Boolean 
sameAddressStreet s e = e.address.street == s
eqEntryBy :: FindByCriteria -> Entry -> Boolean
eqEntryBy (ByName f l)  = sameName f l
eqEntryBy (ByAddressStreet s) = sameAddressStreet s
findEntryBy :: FindByCriteria -> AddressBook -> Maybe Entry
findEntryBy c = filter (eqEntryBy c) >>> head

-- Exercice 3
containsName :: FirstName -> LastName -> AddressBook -> Boolean
containsName f l = filter (sameName f l) >>> null >>> not

booleanToOrdering :: Boolean -> Ordering
booleanToOrdering true = EQ
booleanToOrdering false = LT

compareEntry :: Entry -> Entry -> Ordering
compareEntry a b = sameName a.firstName a.lastName b
                   # booleanToOrdering

removeDuplicates:: AddressBook -> AddressBook
removeDuplicates = nubBy compareEntry