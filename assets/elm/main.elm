module Main exposing (main)

import Browser
import Bulma.CDN exposing (..)
import Bulma.Columns exposing (..)
import Bulma.Components exposing (..)
import Bulma.Elements exposing (..)
import Bulma.Layout exposing (..)
import Bulma.Modifiers exposing (..)
import Debug exposing (log)
import Hero exposing (glareHero)
import Html exposing (Html, div, main_, text)
import Html.Attributes exposing (class)
import Http
import Json.Decode exposing (Decoder, field, list, map5, string)
import TaskCard exposing (taskCard)
import Time exposing (..)
import Types exposing (Task, Tasks)


type Model
    = Failure
    | Loading
    | Success Tasks


type Msg
    = Tick Time.Posix
    | GotTasks (Result Http.Error Tasks)


init : () -> ( Model, Cmd Msg )
init _ =
    ( Loading, getTasksResult )


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every 30000 Tick


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick newTime ->
            -- update here
            ( model, getTasksResult )

        GotTasks result ->
            case result of
                Ok tasks ->
                    ( Success tasks, Cmd.none )

                Err _ ->
                    ( Failure, Cmd.none )


view : Model -> Html Msg
view model =
    case model of
        Failure ->
            div []
                [ text "Failure!"
                ]

        Loading ->
            div []
                [ text "Loading..."
                ]

        Success tasks ->
            main_ []
                [ stylesheet
                , glareHero tasks
                , container [ class "glare-main-container" ]
                    [ columns { columnsModifiers | multiline = True }
                        []
                        (List.map taskCard tasks)
                    ]
                ]


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


getTasksResult : Cmd Msg
getTasksResult =
    Http.get
        { url = "/tasks"
        , expect = Http.expectJson GotTasks tasksDecoder
        }


tasksDecoder : Decoder Tasks
tasksDecoder =
    field "tasks"
        (list
            (map5 Task
                (field "code" string)
                (field "command" string)
                (field "description" string)
                (field "name" string)
                (field "outcome" string)
            )
        )
