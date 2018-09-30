# API Documentation

  * [LumenityChallengeWeb.API.LeagueSeasonPairsController](#lumenitychallengeweb-api-leagueseasonpairscontroller)
    * [index](#lumenitychallengeweb-api-leagueseasonpairscontroller-index)
  * [LumenityChallengeWeb.API.LeagueSeasonsController](#lumenitychallengeweb-api-leagueseasonscontroller)
    * [show](#lumenitychallengeweb-api-leagueseasonscontroller-show)

## LumenityChallengeWeb.API.LeagueSeasonPairsController
### <a id=lumenitychallengeweb-api-leagueseasonpairscontroller-index></a>index
#### json
##### Request
* __Method:__ GET
* __Path:__ /api/league_season_pairs?_format=json

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
```
* __Response body:__
```json
{
  "records": [
    {
      "season": "201516",
      "league": "SP1"
    },
    {
      "season": "201617",
      "league": "SP1"
    }
  ]
}
```

## LumenityChallengeWeb.API.LeagueSeasonsController
### <a id=lumenitychallengeweb-api-leagueseasonscontroller-show></a>show
#### json
##### Request
* __Method:__ GET
* __Path:__ /api/leagues/SP1/seasons/201516?_format=json

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=0, private, must-revalidate
```
* __Response body:__
```json
[
  {
    "season": "201516",
    "id": "381",
    "htr": "D",
    "hthg": 0,
    "htag": 0,
    "home_team": "Malaga",
    "ftr": "D",
    "fthg": 0,
    "ftag": 0,
    "division": "SP1",
    "date": "2015-08-21T00:00:00",
    "away_team": "Sevilla"
  },
  {
    "season": "201516",
    "id": "382",
    "htr": "H",
    "hthg": 1,
    "htag": 0,
    "home_team": "Ath Madrid",
    "ftr": "H",
    "fthg": 1,
    "ftag": 0,
    "division": "SP1",
    "date": "2015-08-22T00:00:00",
    "away_team": "Las Palmas"
  }
]
```

