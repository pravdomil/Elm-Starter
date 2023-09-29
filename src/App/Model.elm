module App.Model exposing (..)

import Browser.Router
import Url


type alias Model =
    { router : Browser.Router.Router Url.Url
    }
