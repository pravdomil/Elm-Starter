module App.Model.View exposing (..)

import App.Model
import App.Msg
import Browser
import Html


view : App.Model.Model -> Browser.Document App.Msg.Msg
view _ =
    Browser.Document
        "Hello World!"
        [ Html.text "Hello World!"
        ]
