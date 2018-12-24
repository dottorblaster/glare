defmodule Glare.TasksChannel do
  use Phoenix.Channel

  def join("tasks:update", _msg, socket) do
    {:ok, socket}
  end

  def broadcast(siren_output) do
    GlareWeb.Endpoint.broadcast!("tasks:update", "new_update", siren_output)
  end
end
