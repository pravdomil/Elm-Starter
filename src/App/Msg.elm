module App.Msg exposing (..)

import Browser
import Url


type Msg
    = NothingHappened
    | UrlRequested Browser.UrlRequest
    | UrlChanged Url.Url
