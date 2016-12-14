module Todo exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- INIT


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { view = view
        , update = update
        , model = model
        }



-- MODEL


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



-- UPDATE


type Msg
    = ChangeTaskText Int String
    | ToggleTask Task Bool


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangeTaskText id text ->
            let
                updateTaskText task =
                    if task.id == id then
                        { task | text = text }
                    else
                        task
            in
                { model | tasks = List.map updateTaskText model.tasks }

        ToggleTask task complete ->
            let
                updateTaskComplete t =
                    if t.id == task.id then
                        { t | complete = not t.complete }
                    else
                        t
            in
                { model | tasks = List.map updateTaskComplete model.tasks }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Todo App" ]
        , viewTasks model.tasks
        ]


viewTasks : List Task -> Html Msg
viewTasks tasks =
    ul [] (List.map viewTask tasks)


viewTask : Task -> Html Msg
viewTask task =
    li []
        [ input [ type_ "checkbox", onCheck (ToggleTask task) ] []
        , input [ value task.text, onInput (ChangeTaskText task.id) ] []
        , span [ class "status" ] [ text (toString task.complete) ]
        ]
