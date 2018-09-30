defmodule LumenityChallengeWeb.API.LeagueSeasonPairsView do
  use LumenityChallengeWeb, :view
  alias LumenityChallengeWeb.Protobufs

  def render("index.json", %{pairs: pairs}) do
    %{
      records: render_many(pairs, __MODULE__, "show.json", as: :league_season_pair)
    }
  end

  def render("show.json", %{league_season_pair: {league, season}}) do
    %{league: league, season: season}
  end

  def render("index.proto", %{pairs: pairs}) do
    Protobufs.LeagueSeasonPairCollection.new(
      records: render_many(pairs, __MODULE__, "show.proto", as: :league_season_pair)
    )
  end

  def render("show.proto", %{league_season_pair: {league, season}}) do
    Protobufs.LeagueSeasonPair.new(%{league: league, season: season})
  end
end
