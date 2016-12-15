module Update exposing (..)

import Model exposing (..)


type Msg
    = UpdateTaskText String
    | ToggleTask Task Bool
    | AddTask


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateTaskText text ->
            { model | newTask = text }

        AddTask ->
            { model | newTask = "" }

        ToggleTask task complete ->
            let
                updateTaskComplete t =
                    if t.id == task.id then
                        { t | complete = not t.complete }
                    else
                        t
            in
                { model | tasks = List.map updateTaskComplete model.tasks }
