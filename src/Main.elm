module Main exposing (..)

import Browser exposing (Document, UrlRequest)
import Browser.Navigation as Navigation
import Html exposing (text)
import Json.Decode as Decode
import Router
import Translation exposing (Translation(..), t)
import Url exposing (Url)


main : Program Decode.Value Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        , onUrlRequest = Router.UrlRequested >> RouterMsg
        , onUrlChange = Router.UrlChanged >> RouterMsg
        }



--


type alias Model =
    { router : Router.Model
    }


init : Decode.Value -> Url -> Navigation.Key -> ( Model, Cmd Msg )
init _ url key =
    ( { router = Router.init url key
      }
    , Cmd.none
    )



--


type Msg
    = RouterMsg Router.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RouterMsg a ->
            Router.update a model.router
                |> Tuple.mapBoth (\v -> { model | router = v }) (Cmd.map RouterMsg)



--


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



--


view : Model -> Document Msg
view _ =
    { title = t A_Title
    , body =
        [ text (t A_Title)
        ]
    }
