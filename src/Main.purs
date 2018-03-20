module Main where

import FFI.Util
import Graphics.Canvas
import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import DOM (DOM)
import DOM.Event.EventTarget (addEventListener)
import DOM.HTML.HTMLInputElement (value)
import DOM.HTML.Types (HTMLInputElement)
import Data.Maybe (Maybe(..))
import Partial.Unsafe (unsafePartial)

foreign import logVal :: forall e a. a -> Eff e Unit
foreign import createField :: forall e a. a -> Eff e Unit
foreign import getElement :: String -> HTMLInputElement

foreign import addListener :: String -> (forall e. Eff (dom :: DOM, console :: CONSOLE | e) Unit) -> Unit

newtype Events = Events {name :: String , description :: String }

collection :: Array Events
collection = []


logValue :: forall e. Eff (dom :: DOM, console :: CONSOLE | e) Unit
logValue = void $ do
  name <- pure $ getElement "name"
  desc <- pure $ getElement "description"
  nameVal <- value name
  descVal <- value desc
  let event = {name: nameVal, description: descVal}
  logVal event
  -- logVal val
  pure unit

main :: forall e. Eff (dom :: DOM, console :: CONSOLE | e) Unit
main = void $ unsafePartial do

  createField "createEvent"
  
  pure $ addListener "submit" logValue
  pure unit
