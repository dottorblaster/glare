module Types exposing (Task, Tasks)


type alias Task =
    { code : String
    , command : String
    , description : String
    , name : String
    , outcome : String
    }


type alias Tasks =
    List Task
