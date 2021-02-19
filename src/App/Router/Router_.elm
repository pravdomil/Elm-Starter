module App.Router.Router_ exposing (..)

import App.App.App exposing (..)
import App.Router.Router exposing (..)
import Browser exposing (UrlRequest)
import Browser.Navigation as Navigation
import Url exposing (Url)


init : Navigation.Key -> Router
init key =
    { key = key
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RouterMsg b ->
            case b of
                UrlRequested c ->
                    urlRequested c model

                UrlChanged c ->
                    urlChanged c model


urlRequested : UrlRequest -> Model -> ( Model, Cmd Msg )
urlRequested _ model =
    ( model, Cmd.none )


urlChanged : Url -> Model -> ( Model, Cmd Msg )
urlChanged _ model =
    ( model, Cmd.none )
