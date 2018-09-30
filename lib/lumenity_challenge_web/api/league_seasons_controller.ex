defmodule LumenityChallengeWeb.API.LeagueSeasonsController do
  use LumenityChallengeWeb, :controller

  def show(conn, %{"league" => league, "season" => season}) do
    render conn, :show, pair: LumenityChallenge.LeagueSeasonService.pair({league, season})
  end
end
