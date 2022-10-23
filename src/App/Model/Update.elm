module App.Model.Update exposing (..)

import App.Model
import App.Msg
import Browser.Navigation
import Browser.QueryRouter
import Json.Decode
import Platform.Extra
import Url


init : Json.Decode.Value -> Url.Url -> Browser.Navigation.Key -> ( App.Model.Model, Cmd App.Msg.Msg )
init _ url key =
    ( { router = Browser.QueryRouter.init App.Model.pageFromUrl url key
      }
    , Cmd.none
    )



--


update : App.Msg.Msg -> App.Model.Model -> ( App.Model.Model, Cmd App.Msg.Msg )
update msg model =
    case msg of
        App.Msg.NothingHappened ->
            Platform.Extra.noOperation model

        App.Msg.UrlRequested a ->
            Browser.QueryRouter.urlRequested a model

        App.Msg.UrlChanged a ->
            Browser.QueryRouter.urlChanged App.Model.pageFromUrl a model



--


subscriptions : App.Model.Model -> Sub App.Msg.Msg
subscriptions _ =
    Sub.none
