defmodule GlareWeb.TaskController do
  use GlareWeb, :controller

  def render_tasks(conn, _params) do
    siren_output = GenServer.call(:executor, :tasks)
    resp(conn, :ok, Jason.encode!(siren_output))
  end
end
