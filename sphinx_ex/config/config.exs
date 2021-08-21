# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sphinx_ex,
  ecto_repos: [SphinxEx.Repo]

# Configures the endpoint
config :sphinx_ex, SphinxExWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0yversGRI3tfYjclKwMOJdDJwyQcQkr6wVAAb0iX0w1qD5q0c+f4Um5+yPkvfv24",
  render_errors: [view: SphinxExWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SphinxEx.PubSub,
  live_view: [signing_salt: "oyZh1ui5"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
