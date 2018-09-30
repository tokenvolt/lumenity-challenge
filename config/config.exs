# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :lumenity_challenge, LumenityChallengeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "475K+e7ER7wut1yP17KaiCZ8g8yCg05Wr6SFCweWAQ5qgqF78SA+jPKOXOZAQtj0",
  render_errors: [view: LumenityChallengeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LumenityChallenge.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
