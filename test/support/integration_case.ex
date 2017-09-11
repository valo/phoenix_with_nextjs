defmodule PhoenixWithNextjs.IntegrationCase do
  use ExUnit.CaseTemplate

  @moduledoc false

  using do
    quote do
      use Hound.Helpers

      import unquote(__MODULE__)
    end
  end

  setup_all do
    wait_for_js_server()
    :ok
  end

  setup do
    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(PhoenixWithNextjs.Repo, self())
    Hound.start_session(
      metadata: metadata,
      additional_capabilities: %{
        chromeOptions: %{ "args" => [
          "--user-agent=#{Hound.Browser.user_agent(:chrome)}",
          "--headless",
          "--disable-gpu"
        ]}
      }
    )
    :ok
  end


  defp wait_for_js_server do
    case :gen_tcp.connect('localhost', 3000, []) do
      {:ok, socket} ->
        :gen_tcp.close(socket)
        true
      {:error, _} ->
        Process.sleep(500)
        wait_for_js_server()
    end
  end
end
