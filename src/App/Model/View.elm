module App.Model.View exposing (..)

import App.Model
import App.Msg
import App.Utils.Translation
import Browser
import Html


view : App.Model.Model -> Browser.Document App.Msg.Msg
view _ =
    { title = App.Utils.Translation.title
    , body =
        [ Html.text App.Utils.Translation.title
        ]
    }
