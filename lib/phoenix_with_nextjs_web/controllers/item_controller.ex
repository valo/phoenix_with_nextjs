defmodule PhoenixWithNextjsWeb.ItemController do
  use PhoenixWithNextjsWeb, :controller

  def index(conn, _params) do
    render conn, "index.json", items: ["Bread", "Butter", "Milk"]
  end
end
