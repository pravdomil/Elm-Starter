module App.Main exposing (..)

import App.Model
import App.Msg
import App.Utils.Translation
import Browser
import Browser.Navigation
import Browser.QueryRouter
import Html
import Json.Decode
import Platform.Extra
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



--


view : App.Model.Model -> Browser.Document App.Msg.Msg
view _ =
    { title = App.Utils.Translation.title
    , body =
        [ Html.text App.Utils.Translation.title
        ]
    }
