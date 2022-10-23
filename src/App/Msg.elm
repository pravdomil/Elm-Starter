module App.Msg exposing (..)

import Browser
import Url


type Msg
    = UrlRequested Browser.UrlRequest
    | UrlChanged Url.Url
