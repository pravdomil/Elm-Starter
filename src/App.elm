module App exposing (..)

import App.Model
import App.Translation
import Browser
import Browser.Navigation
import Browser.QueryRouter
import Html
import Json.Decode
import Url


main : Program Json.Decode.Value App.Model.Model App.Model.Msg
main =
    Browser.application
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        , onUrlRequest = App.Model.UrlRequested
        , onUrlChange = App.Model.UrlChanged
        }



--


init : Json.Decode.Value -> Url.Url -> Browser.Navigation.Key -> ( App.Model.Model, Cmd App.Model.Msg )
init _ url key =
    let
        ( router, routerCmd ) =
            Browser.QueryRouter.init App.Model.pageFromUrl url key App.Model.UrlChanged
    in
    ( { router = router
      }
    , routerCmd
    )



--


update : App.Model.Msg -> App.Model.Model -> ( App.Model.Model, Cmd App.Model.Msg )
update msg model =
    case msg of
        App.Model.UrlRequested a ->
            ( model
            , Browser.QueryRouter.urlRequested a model.router
            )

        App.Model.UrlChanged a ->
            ( { model | router = Browser.QueryRouter.urlChanged App.Model.pageFromUrl a model.router }
            , Cmd.none
            )



--


subscriptions : App.Model.Model -> Sub App.Model.Msg
subscriptions _ =
    Sub.none



--


view : App.Model.Model -> Browser.Document App.Model.Msg
view _ =
    { title = App.Translation.title
    , body =
        [ Html.text App.Translation.title
        ]
    }
