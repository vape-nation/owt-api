{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Endpoints (tourServer) where

import Data.Aeson
import Data.Text
import GHC.Generics

import Servant
import Servant.API

data Tour = Tour { name :: String }
  deriving (Eq, Show, Generic)

sampleTours :: [Tour]
sampleTours = [Tour "Eola", Tour "Winter Park", Tour "UCF"]

type TourApi = "tours" :> Get '[JSON] [Tour]

instance ToJSON Tour
instance FromJSON Tour

tourApi :: Proxy TourApi
tourApi = Proxy

tourEndpoint :: Server TourApi
tourEndpoint = return sampleTours

tourServer :: Application
tourServer = serve tourApi tourEndpoint

