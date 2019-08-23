open Types;
open State;

[@react.component]
let make = () => {
  let (state, dispatch) = React.useReducer(reducer, defaultState);

  React.useEffect0(() => {
    let timerId =
      Js.Global.setInterval(Timer.dispatchingTimer(dispatch), 10000);
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
