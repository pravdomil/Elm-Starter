module App.App.App_ exposing (..)

import App.App.App exposing (..)
import Browser exposing (Document, UrlRequest)
import Browser.Navigation as Navigation
import Html exposing (text)
import Json.Decode as Decode
import Url exposing (Url)


{-| To init model.
-}
init : Decode.Value -> Url -> Navigation.Key -> ( Model, Cmd Msg )
init _ _ _ =
    ( {}
    , Cmd.none
    )


{-| To update model.
-}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlRequested _ ->
            ( model, Cmd.none )

        UrlChanged _ ->
            ( model, Cmd.none )


{-| To handle subscriptions.
-}
subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


{-| To show interface.
-}
view : Model -> Document Msg
view _ =
    { title = "Hello world!"
    , body =
        [ text "Hello world!"
        ]
    }
