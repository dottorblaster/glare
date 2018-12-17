module Main exposing (main)
import Browser
import Html exposing (Html, text)
import Debug exposing (log)
import Time exposing (..)

type alias Model = {}
type Msg = Tick Time.Posix

init : () -> (Model, Cmd Msg)
init _ =
    ({}, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every 30000 Tick

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Tick newTime ->
            -- update here
            ({}, Cmd.none)

view : Model -> Html Msg
view model =
    text "Hello timer!"

main =
    Browser.element
        {
            init = init,
            view = view,
            update = update,
            subscriptions = subscriptions
        }