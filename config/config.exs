# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :indiewebd,
  ecto_repos: [Indiewebd.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :indiewebd, IndiewebdWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: IndiewebdWeb.ErrorHTML, json: IndiewebdWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Indiewebd.PubSub,
  live_view: [signing_salt: "SxA0ZvdU"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  indiewebd: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use built-in JSON parsing in Phoenix
config :phoenix, :json_library, JSON

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
