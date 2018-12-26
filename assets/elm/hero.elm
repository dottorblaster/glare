module Hero exposing (glareHero)

import Bulma.Elements exposing (..)
import Bulma.Layout exposing (..)
import Bulma.Modifiers exposing (..)
import Html exposing (Html, text)
import List exposing (length)
import String exposing (fromInt, join)
import Types exposing (Tasks)


glareHero : Tasks -> Html msg
glareHero tasks =
    hero { heroModifiers | size = Small, color = Light, bold = True }
        []
        [ heroBody []
            [ container []
                [ title H1 [] [ text (join " " [ length tasks |> fromInt, "tasks" ]) ]
                , title H3 [] [ text "Here they are, in all their beauty" ]
                ]
            ]
        ]
