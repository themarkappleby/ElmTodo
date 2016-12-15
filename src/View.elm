module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)
import Update exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Todo App" ]
        , viewInput model.newTask
        , viewTasks model.tasks
        ]


viewInput : String -> Html Msg
viewInput newTask =
    Html.form [ onSubmit AddTask ]
        [ input [ type_ "text", value newTask, onInput UpdateTaskText ] []
        , input [ type_ "submit", value "Add Item" ] []
        ]


viewTasks : List Task -> Html Msg
viewTasks tasks =
    ul []
        (List.map viewTask tasks)


viewTask : Task -> Html Msg
viewTask task =
    li []
        [ input [ type_ "checkbox", onCheck (ToggleTask task) ] []
        , span [] [ text task.text ]
        ]
