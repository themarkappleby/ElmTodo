module Model exposing (..)


type alias Model =
    { tasks : List Task }


type alias Task =
    { id : Int, text : String, complete : Bool }


model : Model
model =
    { tasks =
        [ { id = 1, text = "thing one", complete = False }
        , { id = 2, text = "thing two", complete = False }
        ]
    }
