module TaskCard exposing (taskCard)

import Bulma.Columns exposing (..)
import Bulma.Components exposing (..)
import Bulma.Elements exposing (..)
import Bulma.Modifiers exposing (..)
import Bulma.Modifiers.Typography exposing (Weight(..), italicize, textSize, textWeight)
import Html exposing (Html, code, div, main_, text)
import Html.Attributes exposing (class)
import Types exposing (Task)


taskBadge : String -> Html msg
taskBadge exit_code =
    case exit_code of
        "0" ->
            tag { tagModifiers | size = Medium, color = Success }
                []
                [ text "OK"
                ]

        _ ->
            tag { tagModifiers | size = Medium, color = Danger }
                []
                [ text "KO"
                ]


taskCard : Task -> Html msg
taskCard task =
    column columnModifiers
        [ class "is-half glare-card-column" ]
        [ card [ class "glare-card-el" ]
            [ cardContent []
                [ div [ class "glare-task-name", textWeight Bold ]
                    [ text task.name
                    ]
                , div [ class "glare-task-description", italicize, textSize Bulma.Modifiers.Typography.Small ]
                    [ text task.description
                    ]
                , div [ class "glare-task-command", textSize Bulma.Modifiers.Typography.Small ]
                    [ code []
                        [ text task.command
                        ]
                    ]
                , div [ class "glare-task-badge" ]
                    [ taskBadge task.code
                    ]
                ]
            ]
        ]
