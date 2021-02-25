module Translation exposing (..)


type Translation
    = A_Title


t : Translation -> String
t a =
    case a of
        A_Title ->
            "Hello World!"
