defmodule LumenityChallengeWeb.API.LeagueSeasonPairsView do
  use LumenityChallengeWeb, :view

  # https://hexdocs.pm/phoenix/Phoenix.Template.html#module-format-encoders
  def render("index." <> format, assigns) do
    %{
      pairs: Enum.map(assigns.pairs, fn({league, season}) ->
        %{league: league, season: season}
      end)
    }
  end
end
