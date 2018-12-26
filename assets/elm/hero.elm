module Hero exposing (glareHero)

import Bulma.Elements exposing (..)
import Bulma.Layout exposing (..)
import Bulma.Modifiers exposing (..)
import Html exposing (Html, text)


glareHero : Html msg
glareHero =
    hero { heroModifiers | size = Small, color = Light, bold = True }
        []
        [ heroBody []
            [ container []
                [ title H1 [] [ text "Hero Title" ]
                , title H3 [] [ text "Here they are, in all their beauty" ]
                ]
            ]
        ]
