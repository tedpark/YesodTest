
-- module Main where

-- import Lib
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

-- import Data.Aeson
-- import qualified Data.ByteString.Lazy.Char8 as L
import Data.Text (Text)
import Yesod

data Person = Person
  { name :: Text
  , age :: Int
  }

instance ToJSON Person where
  toJSON Person {..} = object
      [ "name" .= name
      , "age"  .= age
      ]

data App = App

mkYseod "App" [parseRoutes|
/ HomeR GET
|]

instance Yesod App

getHomeR :: Handler value
getHomeR = returnJson $ Person "Michael" 28

main :: IO ()
main = warp 3000 App
