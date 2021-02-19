module Main exposing (..)

import App.App.App exposing (..)
import App.App.App_ exposing (..)
import App.Router.Router exposing (RouterMsg(..))
import Browser
import Json.Decode as Decode


main : Program Decode.Value Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        , onUrlRequest = UrlRequested >> RouterMsg
        , onUrlChange = UrlChanged >> RouterMsg
        }
