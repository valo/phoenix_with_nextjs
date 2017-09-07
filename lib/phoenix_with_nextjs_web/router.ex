defmodule PhoenixWithNextjsWeb.Router do
  use PhoenixWithNextjsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :nextjs do
    plug :accepts, ["html"]
    plug :put_secure_browser_headers
  end

  scope "/api", PhoenixWithNextjsWeb do
    pipe_through :api

    resources "/items", ItemController, only: [:index]
  end

  scope "/" do
    pipe_through [:nextjs]

    get "/*path", ReverseProxy, upstream: ["localhost:3000"]
  end
end
