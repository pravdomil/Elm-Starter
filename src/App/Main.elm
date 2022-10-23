module App.Main exposing (..)

import App.Model
import App.Msg
import App.Translation
import Browser
import Browser.Navigation
import Browser.QueryRouter
import Html
import Json.Decode
import Url


main : Program Json.Decode.Value App.Model.Model App.Msg.Msg
main =
    Browser.application
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        , onUrlRequest = App.Msg.UrlRequested
        , onUrlChange = App.Msg.UrlChanged
        }



--


init : Json.Decode.Value -> Url.Url -> Browser.Navigation.Key -> ( App.Model.Model, Cmd App.Msg.Msg )
init _ url key =
    let
        ( router, routerCmd ) =
            Browser.QueryRouter.init App.Model.pageFromUrl url key App.Msg.UrlChanged
    in
    ( { router = router
      }
    , routerCmd
    )



--


update : App.Msg.Msg -> App.Model.Model -> ( App.Model.Model, Cmd App.Msg.Msg )
update msg model =
    case msg of
        App.Msg.UrlRequested a ->
            ( model
            , Browser.QueryRouter.urlRequested a model.router
            )

        App.Msg.UrlChanged a ->
            ( { model | router = Browser.QueryRouter.urlChanged App.Model.pageFromUrl a model.router }
            , Cmd.none
            )



--


subscriptions : App.Model.Model -> Sub App.Msg.Msg
subscriptions _ =
    Sub.none



--


view : App.Model.Model -> Browser.Document App.Msg.Msg
view _ =
    { title = App.Translation.title
    , body =
        [ Html.text App.Translation.title
        ]
    }
