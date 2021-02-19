module App.App.App exposing (..)

import App.Router.Router exposing (Router, RouterMsg)


type alias Model =
    { router : Router
    }


type Msg
    = RouterMsg RouterMsg
