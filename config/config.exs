# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :jf,
  ecto_repos: [Jf.Repo]

# Configures the endpoint
config :jf, JfWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "u5sQ9qD1xlfnKrSTLfFhUF3xaLyfy+n4wC9bKfgvt0/PVfUyjugiY3YJZ1BdYl3F",
  render_errors: [view: JfWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Jf.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
