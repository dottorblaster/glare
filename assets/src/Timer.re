open Types;

let dispatchingTimer = (dispatch, ()) => {
  dispatch(StartFetching);
  let _ =
    Js.Promise.(
      Api.getTasks
      |> then_(res => {
           let {tasks} = Decode.response(res);
           dispatch(StopFetching);
           dispatch(SetChecks(tasks));
           resolve(res);
         })
    );
  ();
};
