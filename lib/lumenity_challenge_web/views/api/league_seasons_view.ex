defmodule LumenityChallengeWeb.API.LeagueSeasonsView do
  use LumenityChallengeWeb, :view
  alias LumenityChallengeWeb.Protobufs

  def render("show.json", %{pair: pair}) do
    pair
  end

  def render("show.proto", %{pair: matches}) do
    Protobufs.MatchCollection.new(
      records: matches |> Enum.map(fn (%{date: date} = match) ->
        match
        |> Map.put(:date, Protobufs.from_date(date))
        |> Protobufs.Match.new()
      end)
    )
  end
end
