defmodule LumenityChallengeWeb.API.LeagueSeasonPairsController do
  use LumenityChallengeWeb, :controller

  def index(conn, _params) do
    render conn, :index, pairs: LumenityChallenge.LeagueSeasonService.pairs
  end
end
