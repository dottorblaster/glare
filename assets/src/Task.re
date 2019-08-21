[@react.component]
let make = (~code, ~name, ~description, ~command, ~outcome) =>
  <div className="task-card card">
    <div className="card-header">
      <div className="card-title h5"> {ReasonReact.string(name)} </div>
      <div className="card-subtitle">
        <StatusChip error={code !== "0"} />
      </div>
    </div>
    <div className="card-body">
      <p> {ReasonReact.string(description)} </p>
      <p> <code> {ReasonReact.string(command)} </code> </p>
    </div>
    <div className="card-footer">
      <Accordion title="See output" error={code !== "0"}>
        <pre className="glare-code code"> {ReasonReact.string(outcome)} </pre>
      </Accordion>
    </div>
  </div>;
