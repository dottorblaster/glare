defmodule GlareWeb.PageController do
  use GlareWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
