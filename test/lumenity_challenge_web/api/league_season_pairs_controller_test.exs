defmodule LumenityChallengeWeb.API.LeagueSeasonPairsControllerTest do
  use LumenityChallengeWeb.ConnCase
  alias LumenityChallengeWeb.Protobufs

  test "json", %{conn: conn} do
    resp = conn |> get(league_season_pairs_path(conn, :index, %{"_format" => "json"}))

    assert data = json_response(resp, 200)
    assert data == %{"records" => [%{"league" => "SP1", "season" => "201516"}, %{"season" => "201617", "league" => "SP1"}]}
  end

  test "proto", %{conn: conn} do
    resp = conn |> get(league_season_pairs_path(conn, :index, %{"_format" => "proto"}))

    assert data = resp.resp_body
    assert Protobufs.LeagueSeasonPairCollection.decode(data) ==
               %Protobufs.LeagueSeasonPairCollection{
                 records: [
                   %Protobufs.LeagueSeasonPair{
                     league: "SP1",
                     season: "201516"
                   },
                   %Protobufs.LeagueSeasonPair{
                     league: "SP1",
                     season: "201617"
                   }
                 ]
               }
  end
end
