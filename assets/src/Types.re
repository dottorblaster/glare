type task = {
  code: string,
  command: string,
  description: string,
  name: string,
  outcome: string,
};

type tasks = list(task);

type response = {tasks};

type state = {
  error: bool,
  fetching: bool,
  checks: tasks,
};

type action =
  | StartFetching
  | StopFetching
  | HasError
  | ClearErrors
  | SetChecks(tasks);
