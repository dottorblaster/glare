module TaskCard exposing (taskCard)

import Bulma.Columns exposing (..)
import Bulma.Components exposing (..)
import Html exposing (Html, main_, text)
import Html.Attributes exposing (class)


taskCard : String -> Html msg
taskCard internalText =
    column columnModifiers
        [ class "is-half glare-card-column" ]
        [ card [ class "glare-card-el" ]
            [ cardContent [] [ text internalText ]
            ]
        ]
