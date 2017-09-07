# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_with_nextjs,
  ecto_repos: [PhoenixWithNextjs.Repo]

# Configures the endpoint
config :phoenix_with_nextjs, PhoenixWithNextjsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Vq7Rfo0T4EfiLX2/ryYal3O0l9ebBNhyh58cfWdTAUHxEJGu2p9u1WTQ31Ki4Phj",
  render_errors: [view: PhoenixWithNextjsWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: PhoenixWithNextjs.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
