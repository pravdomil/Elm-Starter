module Router exposing (..)

import Browser exposing (UrlRequest)
import Browser.Navigation as Navigation
import Url exposing (Url)


type alias Model =
    { key : Navigation.Key
    }


init : Url -> Navigation.Key -> Model
init url key =
    { key = key
    }



--


type Msg
    = UrlRequested UrlRequest
    | UrlChanged Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlRequested a ->
            case a of
                Browser.Internal url ->
                    ( model
                    , Navigation.pushUrl model.key (Url.toString url)
                    )

                Browser.External url ->
                    ( model
                    , Navigation.load url
                    )

        UrlChanged a ->
            ( model
            , Cmd.none
            )
