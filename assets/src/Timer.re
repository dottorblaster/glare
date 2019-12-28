open Types;

let dispatchingTimer = (dispatch, ()) => {
  dispatch(StartFetching);
  let _ =
    Js.Promise.(
      Fetch.fetch(Api.tasksEndpoint)
      |> then_(Fetch.Response.json)
      |> then_(res => {
           Js.log(res);
           let {tasks} = Decode.response(res);
           dispatch(StopFetching);
           dispatch(SetChecks(tasks));
           resolve(res);
         })
    );
  ();
};
