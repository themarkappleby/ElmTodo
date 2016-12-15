module Update exposing (..)

import Model exposing (..)
import Array exposing (push)


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
            let
                newTask : Task
                newTask =
                    Task model.newId model.newTask False

                tasks : List Task
                tasks =
                    List.append model.tasks [ newTask ]
            in
                { newTask = "", newId = model.newId + 1, tasks = tasks }

        ToggleTask task complete ->
            let
                updateTaskComplete t =
                    if t.id == task.id then
                        { t | complete = not t.complete }
                    else
                        t
            in
                { model | tasks = List.map updateTaskComplete model.tasks }
