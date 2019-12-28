let tasksEndpoint = "/tasks";

let getTasks =
  Fetch.fetch("/tasks") |> Js.Promise.then_(Fetch.Response.json);
