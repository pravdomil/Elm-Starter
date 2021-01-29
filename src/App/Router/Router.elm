module App.Router.Router exposing (..)

import Browser exposing (UrlRequest)
import Browser.Navigation as Navigation
import Url exposing (Url)


{-| -}
type alias Router =
    { key : Navigation.Key
    }


{-| -}
type RouterMsg
    = UrlRequested UrlRequest
    | UrlChanged Url
