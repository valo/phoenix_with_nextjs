defmodule Integartion.HomeTest do
  use PhoenixWithNextjs.IntegrationCase

  test "rendering the home page" do
    navigate_to("http://localhost:4000/")

    assert find_element(:tag, "h1") |> inner_text == "Welcome to NextJS!"

    click({:id, "about"})

    content = find_element(:class, "content")

    assert content |> visible_text() =~ "This is a simple phoenix app"
  end
end
