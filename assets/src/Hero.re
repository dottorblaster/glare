[@react.component]
let make = (~checks, ~errors) => {
  let heroClasses = errors > 0 ? "hero bg-error" : "hero bg-success";

  let title =
    switch (errors) {
    | 0 =>
      "Here are your "
      ++ string_of_int(checks)
      ++ " checks sir "
      ++ {js| 🎩 |js}
    | _ =>
      "Dude, you have "
      ++ string_of_int(errors)
      ++ " errors "
      ++ {js| 🔥 |js}
    };

  <div className="columns">
    <div className="column col-12">
      <div className=heroClasses>
        <div className="hero-body">
          <h1> {ReasonReact.string(title)} </h1>
          <p> {ReasonReact.string("You can easily monitor them here")} </p>
        </div>
      </div>
    </div>
  </div>;
};
