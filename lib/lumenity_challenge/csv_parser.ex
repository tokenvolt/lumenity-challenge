NimbleCSV.define(CSVParser, separator: ",", escape: "\"")

defmodule LumenityChallenge.CSV do
  use Timex

  def safe_string_to_integer(str) do
    case Integer.parse(str) do
      {value, _} -> value
      :error -> :error
    end
  end

  def safe_date_parse(str_date) do
    case Timex.parse(str_date, "%d/%m/%y", :strftime) do
      {:ok, date} -> date
      {:error, _reason} -> :invalid_date
    end
  end

  def import(filepath) do
    filepath
    |> File.stream!
    |> CSVParser.parse_stream
    |> Stream.map(fn [id, division, season, date, home_team, away_team, fthg, ftag, ftr, hthg, htag, htr] ->
      # Define a struct
      %{
       id: id,
       division: division,
       season: season,
       date: safe_date_parse(date),
       home_team: home_team,
       away_team: away_team,
       fthg: safe_string_to_integer(fthg),
       ftag: safe_string_to_integer(ftag),
       ftr: ftr,
       hthg: safe_string_to_integer(hthg),
       htag: safe_string_to_integer(htag),
       htr: htr
      }
    end)
  end
end
