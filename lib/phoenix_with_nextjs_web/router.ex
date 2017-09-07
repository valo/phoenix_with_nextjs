defmodule PhoenixWithNextjsWeb.Router do
  use PhoenixWithNextjsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhoenixWithNextjsWeb do
    pipe_through :api
  end
end
