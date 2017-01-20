module Main where

import Network.Wai
import Network.Wai.Handler.Warp

import Endpoints (tourServer)

main :: IO ()
main = run 8081 tourServer
