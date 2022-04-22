module Main
  ( alphanumeric
  , defaultAlphabet
  , hexadecimalLowercase
  , hexadecimalUppercase
  , lowercase
  , nanoId
  , nanoId'
  , nolookalikes
  , nolookalikesSafe
  , numbers
  , pickRandomChar
  , uppercase
  ) where

import Prelude

import Data.Array (index, length, replicate)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.String.CodeUnits (fromCharArray, toCharArray)
import Data.Traversable (for)
import Effect (Effect)
import Effect.Random (randomInt)

-- The default 'Alphabet', made of URL-friendly symbols.
defaultAlphabet ∷ String
defaultAlphabet = "ABCDEFGHIJKLMNOPKRSTUVWXYZ_1234567890-abcdefghijklmnopqrstuvwxyz"

-- * Some predefined Alphabets, borrowed from ~~https://github.com/CyberAP/nanoid-dictionary~~
--                                              https://github.com/MichelBoucey/NanoID  
numbers ∷ String
numbers = "1234567890"

hexadecimalLowercase ∷ String
hexadecimalLowercase = "0123456789abcdef"

hexadecimalUppercase ∷ String
hexadecimalUppercase = "0123456789ABCDEF"

lowercase ∷ String
lowercase = "abcdefghijklmnopqrstuvwxyz"

uppercase ∷ String
uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

alphanumeric ∷ String
alphanumeric = "ABCDEFGHIJKLMNOPKRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz"

nolookalikes ∷ String
nolookalikes = "346789ABCDEFGHJKLMNPQRTUVWXYabcdefghijkmnpqrtwxyz"

nolookalikesSafe ∷ String
nolookalikesSafe = "6789ABCDEFGHJKLMNPQRTUWYabcdefghijkmnpqrtwyz"

-- | Picks a random char from a given string
pickRandomChar :: String -> Effect (Maybe Char)
pickRandomChar string = do
  let charArray = toCharArray string
  let len = length charArray
  randomIndex <- randomInt 0 (len - 1)
  pure $ index charArray randomIndex

generate :: Int -> String -> Effect (Maybe String)
generate len str
  | len > 0 && str /= "" = do
      let arrayOfEmptyChars = replicate len ' '
      charArray <- for arrayOfEmptyChars \_ -> ado
        char <- pickRandomChar str
        in fromMaybe ' ' char
      pure $ Just $ fromCharArray charArray
  | otherwise = pure Nothing

-- | Generates a string of random characters of length 21 using the `defaultAlphabet` which is link friendly.
nanoId :: Effect (Maybe String)
nanoId = generate 21 defaultAlphabet

-- | Generates a string of random characters of a given length and a string of characters
nanoId' :: Int -> String -> Effect (Maybe String)
nanoId' = generate