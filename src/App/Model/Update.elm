module App.Model.Update exposing (..)

import App.Model
import App.Msg
import Browser.Navigation
import Browser.Router
import Json.Decode
import Platform.Extra
import Url


init : Json.Decode.Value -> Url.Url -> Browser.Navigation.Key -> ( App.Model.Model, Cmd App.Msg.Msg )
init _ url key =
    ( App.Model.Model
        (Browser.Router.init Browser.Router.fileBaseUrl identity url key)
    , Cmd.none
    )



--


update : App.Msg.Msg -> App.Model.Model -> ( App.Model.Model, Cmd App.Msg.Msg )
update msg =
    case msg of
        App.Msg.NothingHappened ->
            Platform.Extra.noOperation

        App.Msg.UrlRequested a ->
            Browser.Router.urlRequested Browser.Router.fileBaseUrl a

        App.Msg.UrlChanged a ->
            Browser.Router.urlChanged identity a



--


subscriptions : App.Model.Model -> Sub App.Msg.Msg
subscriptions _ =
    Sub.none
