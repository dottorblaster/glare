open Types;

let task = json =>
  Json.Decode.{
    code: json |> field("code", string),
    command: json |> field("command", string),
    description: json |> field("description", string),
    name: json |> field("name", string),
    outcome: json |> field("outcome", string),
  };

let tasks = json => Json.Decode.(json |> array(task));

let response = json =>
  Json.Decode.{tasks: json |> field("tasks", list(task))};
