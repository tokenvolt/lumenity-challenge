defmodule LumenityChallenge.LeagueSeasonService do
  use GenServer
  alias LumenityChallenge.CSV

  # Client

  def start_link(filepath) do
    GenServer.start_link(__MODULE__, filepath, name: LeagueSeasons)
  end

  def pair(league_season_pair) do
    GenServer.call(LeagueSeasons, {:pair, league_season_pair})
  end

  def pairs do
    GenServer.call(LeagueSeasons, :pairs)
  end

  # Server

  @impl true
  def init(_) do
    {
      :ok,
      CSV.import("./data.csv")
      |> Enum.group_by(fn(a) -> {Map.get(a, :division), Map.get(a, :season)} end)
    }
  end

  @impl true
  def handle_call(:pairs, _from, state) do
    {:reply, state |> Map.keys, state}
  end

  @impl true
  def handle_call({:pair, {league, season}}, _from, state) do
    {:reply, state |> Map.get({league, season}), state}
  end
end
