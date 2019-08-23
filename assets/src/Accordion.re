[@react.component]
let make = (~title, ~error, ~children) => {
  let (isOpen, setOpen) = React.useState(() => false);

  let btnClasses = error ? "btn btn-error btn-sm" : "btn btn-success btn-sm";
  let iconClasses = isOpen ? "icon icon-arrow-down" : "icon icon-arrow-right";

  <div>
    <div>
      <button className=btnClasses onClick={_ => setOpen(_ => !isOpen)}>
        <i className=iconClasses />
        {ReasonReact.string(title)}
      </button>
    </div>
    {isOpen ? children : ReasonReact.null}
  </div>;
};
