defmodule Glare.TasksChannel do
  use Phoenix.Channel

  @moduledoc """
  There's nothing here.

  JK, this is a convenience module concerning Channels, but Elm's
  WS support is shitty right now, so.
  """

  def join("tasks:update", _msg, socket) do
    {:ok, socket}
  end

  def broadcast(siren_output) do
    GlareWeb.Endpoint.broadcast!("tasks:update", "new_update", siren_output)
  end
end
