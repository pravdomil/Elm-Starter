module App.Model.Update exposing (..)

import App.Model
import App.Msg
import Browser
import Browser.Navigation
import Json.Decode
import Platform.Extra
import Url


init : Json.Decode.Value -> Url.Url -> Browser.Navigation.Key -> ( App.Model.Model, Cmd App.Msg.Msg )
init _ _ _ =
    ( App.Model.Model
    , Cmd.none
    )



--


update : App.Msg.Msg -> App.Model.Model -> ( App.Model.Model, Cmd App.Msg.Msg )
update msg =
    case msg of
        App.Msg.NothingHappened ->
            Platform.Extra.noOperation

        App.Msg.UrlRequested a ->
            \model ->
                case a of
                    Browser.Internal b ->
                        ( model, Browser.Navigation.load (Url.toString b) )

                    Browser.External b ->
                        ( model, Browser.Navigation.load b )

        App.Msg.UrlChanged _ ->
            Platform.Extra.noOperation



--


subscriptions : App.Model.Model -> Sub App.Msg.Msg
subscriptions _ =
    Sub.none
