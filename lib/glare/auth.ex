defmodule Glare.Auth do
  import Plug.Conn

  @moduledoc """
  Authentication module. It basically manages runtime HTTP basic auth.
  """

  defp check(username, password) do
    username === System.get_env("GLARE_USERNAME") && password === System.get_env("GLARE_PASSWORD")
  end

  def authenticate(conn, username, password) do
    case check(username, password) do
      true ->
        assign(conn, :current_user, System.get_env("GLARE_USERNAME"))

      _ ->
        halt(conn)
    end
  end
end
