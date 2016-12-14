module Update exposing (..)

import Model exposing (..)


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
