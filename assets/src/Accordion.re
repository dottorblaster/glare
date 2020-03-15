[@react.component]
let make = (~title, ~error, ~children) => {
  let (isOpen, setOpen) = React.useState(() => false);

  let btnClasses =
    error ?
      "accordion-btn btn btn-error btn-sm" :
      "accordion-btn btn btn-success btn-sm";
  let iconClasses =
    isOpen ?
      "accordion-icon icon icon-arrow-down" :
      "accordion-icon icon icon-arrow-right";

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
