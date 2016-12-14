module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)
import Update exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Todo App Test" ]
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
