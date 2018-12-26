defmodule GlareWeb.Router do
  use GlareWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug BasicAuth, callback: &Glare.Auth.authenticate/3
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GlareWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/tasks", TaskController, :render_tasks
  end

  # Other scopes may use custom stacks.
  # scope "/api", GlareWeb do
  #   pipe_through :api
  # end
end
