[@react.component]
let make = (~error) => {
  let okStyle = ReactDOMRe.Style.make(~backgroundColor="#32b643", ());
  let koStyle = ReactDOMRe.Style.make(~backgroundColor="#e85600", ());
  let text = error ? "KO" : "OK";

  <div className="chip status-chip">
    <figure className="avatar avatar-sm" style={error ? koStyle : okStyle} />
    {ReasonReact.string(text)}
  </div>;
};
