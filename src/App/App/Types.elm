module App.App.Types exposing (..)

import Browser exposing (UrlRequest)
import Url exposing (Url)


{-| To define things we keep.
-}
type alias Model =
    {}


{-| To define what can happen.
-}
type Msg
    = UrlRequested UrlRequest
    | UrlChanged Url
