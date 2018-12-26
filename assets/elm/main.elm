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
import Html exposing (Html, main_, text)
import Html.Attributes exposing (class)
import TaskCard exposing (taskCard)
import Time exposing (..)


type alias Model =
    {}


type Msg
    = Tick Time.Posix


init : () -> ( Model, Cmd Msg )
init _ =
    ( {}, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every 30000 Tick


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick newTime ->
            -- update here
            ( {}, Cmd.none )


view : Model -> Html Msg
view model =
    main_ []
        [ stylesheet
        , glareHero
        , container [ class "glare-main-container" ]
            [ columns { columnsModifiers | multiline = True }
                []
                [ taskCard "some random string"
                , taskCard "lulz"
                , taskCard "aone"
                , taskCard "keks"
                ]
            ]
        ]


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
