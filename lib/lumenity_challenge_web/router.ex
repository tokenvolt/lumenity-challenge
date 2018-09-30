defmodule LumenityChallengeWeb.Router do
  use LumenityChallengeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json", "proto"]
  end

  scope "/", LumenityChallengeWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", LumenityChallengeWeb.API do
    pipe_through :api

    get "/league_season_pairs", LeagueSeasonPairsController, :index
    get "/leagues/:league/seasons/:season", LeagueSeasonsController, :show
  end
end
