use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_with_nextjs, PhoenixWithNextjsWeb.Endpoint,
  http: [port: 4000],
  server: true,
  watchers: [yarn: ["dev", cd: Path.expand("../app", __DIR__)]]

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :phoenix_with_nextjs, PhoenixWithNextjs.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "phoenix_with_nextjs_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :hound, driver: "chrome_driver"
