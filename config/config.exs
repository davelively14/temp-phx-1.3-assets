# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :temp,
  ecto_repos: [Temp.Repo]

# Configures the endpoint
config :temp, Temp.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3Rob6KWmF1c5t7OZ0QO3AiIVeh9pL2GortWXp2AiXazSZvXZLxQEmv90V98IXD0W",
  render_errors: [view: Temp.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Temp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
