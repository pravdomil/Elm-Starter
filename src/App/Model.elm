module App.Model exposing (..)

import Browser.QueryRouter
import Dict
import Url
import Url.QueryString


type alias Model =
    { router : Browser.QueryRouter.QueryRouter Page
    }



--


type alias Page =
    { query : Dict.Dict String String
    }


pageFromUrl : Url.Url -> Page
pageFromUrl a =
    { query = a.query |> Maybe.withDefault "" |> Url.QueryString.fromString
    }


pageToUrl : Page -> String
pageToUrl a =
    "?" ++ Url.QueryString.toString a.query
