# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :api_server,
  ecto_repos: [ApiServer.Repo]

# Configures the endpoint
config :api_server, ApiServerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FVr935hTr9JNKNNqh88gSUmcOcJleIlV20RI+UdsfFYzRQF+qL4VcRQ2fZlp/gYW",
  render_errors: [view: ApiServerWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ApiServer.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
