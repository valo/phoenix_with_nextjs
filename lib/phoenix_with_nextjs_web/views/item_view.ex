defmodule PhoenixWithNextjsWeb.ItemView do
  use PhoenixWithNextjsWeb, :view

  def render("index.json", %{items: items}) do
    %{
      items: items
    }
  end
end
