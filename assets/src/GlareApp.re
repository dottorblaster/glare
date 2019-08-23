open Types;

[@react.component]
let make = () => {
  let (state, dispatch) =
    React.useReducer(
      (state, action) =>
        switch (action) {
        | StartFetching => {...state, fetching: true}
        | StopFetching => {...state, fetching: false}
        | HasError => {...state, error: true}
        | ClearErrors => {...state, error: false}
        | SetChecks(checks) => {...state, checks}
        },
      {error: false, fetching: false, checks: []},
    );

  React.useEffect0(() => {
    let timerId =
      Js.Global.setInterval(
        () => {
          dispatch(StartFetching);
          let _ =
            Js.Promise.(
              Fetch.fetch("/tasks")
              |> then_(Fetch.Response.json)
              |> then_(res => {
                   let {tasks} = Decode.response(res);
                   dispatch(StopFetching);
                   dispatch(SetChecks(tasks));
                   resolve(res);
                 })
            );
          ();
        },
        10000,
      );
    Some(() => Js.Global.clearInterval(timerId));
  });

  let {checks} = state;

  let errorCount =
    Belt.List.reduce(
      checks,
      0,
      (erroringChecks, check) => {
        let {code} = check;
        switch (code) {
        | "0" => erroringChecks
        | _ => erroringChecks + 1
        };
      },
    );

  <>
    <Hero checks={List.length(checks)} errors=errorCount />
    <div className="container">
      <div className="columns">
        {
          List.map(
            check => {
              let {code, name, description, command, outcome} = check;

              <Task
                key={check.command}
                code
                name
                description
                command
                outcome
              />;
            },
            checks,
          )
          |> Array.of_list
          |> ReasonReact.array
        }
      </div>
    </div>
  </>;
};
