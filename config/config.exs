# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :our_bills,
  ecto_repos: [OurBills.Repo]

# Configures the endpoint
config :our_bills, OurBillsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ThbaT6maF7/5hBTVGmE8W2CwMdJHX3CBjtsbWvey7QPeu6+IZL32rNG0kkw+iqpt",
  render_errors: [view: OurBillsWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: OurBills.PubSub,
  live_view: [signing_salt: "SDq5gBhK"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :money,
  default_currency: :BRL,
  separator: ".",
  delimeter: ",",
  symbol: false,
  symbol_on_right: false,
  symbol_space: true,
  fractional_unit: true

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
