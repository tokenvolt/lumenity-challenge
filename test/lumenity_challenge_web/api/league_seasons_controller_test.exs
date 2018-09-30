defmodule LumenityChallengeWeb.API.LeagueSeasonsControllerTest do
  use LumenityChallengeWeb.ConnCase
  alias LumenityChallengeWeb.Protobufs

  test "json", %{conn: conn} do
    resp = conn |> get(league_seasons_path(conn, :show, "SP1", "201516", %{
      "_format" => "json"
    })) |> doc

    assert data = json_response(resp, 200)
    assert data == [
              %{
                "away_team" => "Sevilla",
                "date" => "2015-08-21T00:00:00",
                "division" => "SP1",
                "ftag" => 0,
                "fthg" => 0,
                "ftr" => "D",
                "home_team" => "Malaga",
                "htag" => 0,
                "hthg" => 0,
                "htr" => "D",
                "id" => "381",
                "season" => "201516"
              },
              %{
                "away_team" => "Las Palmas",
                "date" => "2015-08-22T00:00:00",
                "division" => "SP1",
                "ftag" => 0,
                "fthg" => 1,
                "ftr" => "H",
                "home_team" => "Ath Madrid",
                "htag" => 0,
                "hthg" => 1,
                "htr" => "H",
                "id" => "382",
                "season" => "201516"
              }
            ]
  end

  test "proto", %{conn: conn} do
    resp = conn |> get(league_seasons_path(conn, :show, "SP1", "201516", %{
      "_format" => "proto"
    }))

    assert data = resp.resp_body
    assert Protobufs.MatchCollection.decode(data) == %Protobufs.MatchCollection{
              records: [
                %Protobufs.Match{
                  away_team: "Sevilla",
                  date: %Protobufs.Date{
                    day: 21,
                    month: 8,
                    year: 2015
                  },
                  ftag: 0,
                  fthg: 0,
                  ftr: "D",
                  home_team: "Malaga",
                  htag: 0,
                  hthg: 0,
                  htr: "D",
                  league: "",
                  season: "201516"
                },
                %Protobufs.Match{
                  away_team: "Las Palmas",
                  date: %Protobufs.Date{
                    day: 22,
                    month: 8,
                    year: 2015
                  },
                  ftag: 0,
                  fthg: 1,
                  ftr: "H",
                  home_team: "Ath Madrid",
                  htag: 0,
                  hthg: 1,
                  htr: "H",
                  league: "",
                  season: "201516"
                }
              ]
            }
  end
end
