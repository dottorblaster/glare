defmodule Glare.Auth do
  import Plug.Conn

  @moduledoc """
  Authentication module. It basically manages runtime HTTP basic auth.
  """

  @glare_username System.get_env("GLARE_USERNAME")
  @glare_password System.get_env("GLARE_PASSWORD")

  defp check(username, password) do
    username === @glare_username && password === @glare_password
  end

  def authenticate(conn, username, password) do
    case check(username, password) do
      true ->
        assign(conn, :current_user, @glare_username)

      _ ->
        halt(conn)
    end
  end
end
