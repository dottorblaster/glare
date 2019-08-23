open Types;

let defaultState = {error: false, fetching: false, checks: []};

let reducer = (state, action) =>
  switch (action) {
  | StartFetching => {...state, fetching: true}
  | StopFetching => {...state, fetching: false}
  | HasError => {...state, error: true}
  | ClearErrors => {...state, error: false}
  | SetChecks(checks) => {...state, checks}
  };
