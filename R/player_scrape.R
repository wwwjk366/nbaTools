#' Player list
#'
#' @return data frame with all players
#' @keywords player
#' @export
#' @examples
#' # GetPlayerIDs()

GetPlayerIDs <- function(...) {

  endpoint <- 'commonallplayers'
  referer <- 'player'
  ix <- 1

  param.keys <- c('IsOnlyCurrentSeason', 'LeagueID', 'Season')

  return(GetData(endpoint, referer, ix, param.keys, source = 'NBA', ...))
}

#' Player game logs
#'
#' @return data frame with all games for a player
#' @keywords player game log
#' @export
#' @examples
#' # GetPlayerGameLogs()

GetPlayerGameLogs <- function(...) {

  endpoint <- 'playergamelogs'
  referer <- 'player'
  ix <- 1

  param.keys <- c('DateFrom', 'DateTo', 'GameSegment', 'LastNGames', 'LeagueID', 'Location', 'MeasureType',
                  'Month', 'OpponentTeamID', 'Outcome', 'PORound', 'PaceAdjust', 'PerMode', 'Period',
                  'PlayerID', 'PlusMinus', 'Rank', 'Season', 'SeasonSegment', 'SeasonType', 'ShotClockRange',
                  'VsConference', 'VsDivision')

  return(GetData(endpoint, referer, ix, param.keys, source = 'NBA', ...))
}

#' Player year over year stats
#'
#' @return data frame with players yearly stats
#' @keywords player game log
#' @export
#' @examples
#' # GetPlayerYearByYearStats(PlayerID = '2544')

GetPlayerYearByYearStats <- function(split = 'Advanced', source = 'NBA', ...) {

  if (source == 'NBA') {
    endpoint <- 'playerdashboardbyyearoveryear'
    referer <- 'player'

    param.keys <- c('DateFrom', 'DateTo', 'GameSegment', 'LastNGames', 'LeagueID', 'Location', 'MeasureType',
                    'Month', 'OpponentTeamID', 'Outcome', 'PORound', 'PaceAdjust', 'PerMode', 'Period',
                    'PlayerID', 'PlusMinus', 'Rank', 'Season', 'SeasonSegment', 'SeasonType', 'ShotClockRange',
                    'Split', 'VsConference', 'VsDivision')

    if (split == 'Traditional') {
      ix <- 1
    } else if (split == 'Advanced') {
      ix <- 2
    } else if (split == 'Misc') {
      ix <- 3
    } else if (split == 'Scoring') {
      ix <- 4
    } else if (split == 'Usage') {
      ix <- 5
    }
  } else if (source == 'BRef') {
    endpoint <- 'players/<PlayerID>.html'
    referer <- ''
    param.keys <- c('PlayerID')

    if (split == 'Per Game') {
      ix <- 1
    } else if (split == 'Totals') {
      ix <- 2
    } else if (split == 'Per 36 Minutes') {
      ix <- 3
    } else if (split == 'Per 100 Possessions') {
      ix <- 4
    } else if (split == 'Advanced') {
      ix <- 5
    } else if (split == 'Shooting') {
      ix <- 6
    } else if (split == 'Play By Play') {
      ix <- 7
    }
  }

  return(GetData(endpoint, referer, ix, param.keys, source, ...))
}

#' Player shooting splits
#'
#' @return data frame with players shooting splits
#' @keywords player shooting splits
#' @export
#' @examples
#' # GetPlayerShootingSplits(PlayerID = '2544')

GetPlayerShootingSplits <- function(split = 'Areas', ...) {

  endpoint <- 'playerdashboardbyshootingsplits'
  referer <- 'player'

  param.keys <- c('DateFrom', 'DateTo', 'GameSegment', 'LastNGames', 'LeagueID', 'Location', 'MeasureType',
                  'Month', 'OpponentTeamID', 'Outcome', 'PORound', 'PaceAdjust', 'PerMode', 'Period',
                  'PlayerID', 'PlusMinus', 'Rank', 'Season', 'SeasonSegment', 'SeasonType', 'ShotClockRange',
                  'Split', 'VsConference', 'VsDivision')

  if (split == 'General') {
    ix <- 1
  } else if (split == '5ft') {
    ix <- 2
  } else if (split == '8ft') {
    ix <- 3
  } else if (split == 'Areas') {
    ix <- 4
  } else if (split == 'Assisted') {
    ix <- 5
  } else if (split == 'Type') {
    ix <- 6
  } else if (split == 'Detail') {
    ix <- 7
  } else if (split == 'Assisted By') {
    ix <- 8
  }

  return(GetData(endpoint, referer, ix, param.keys, source = 'NBA', ...))
}




#' Shot tracking
#'
#' @param ...
#'
#' @return data
#' @export
#'
#' @examples
#' GetShotChart( PlayerID = 2772,Season = "2017-18",SeasonType = "Regular Season", ContextMeasure = "FGA", TeamID = 0)
GetShotChart <- function(...) {

  endpoint <- 'shotchartdetail'
  referer <- 'player'
  ix <- 1


  param.keys <- c('DateFrom', 'DateTo', 'GameSegment', 'LastNGames', 'LeagueID', 'Location', 'MeasureType',
                  'Month', 'OpponentTeamID', 'Outcome', 'Position', 'PaceAdjust', 'PerMode', 'Period',
                  'PlayerID', 'PlusMinus', 'Rank', 'Season', 'SeasonSegment', 'SeasonType', 'ShotClockRange',
                  'RookieYear', 'VsConference', 'VsDivision', 'PlayerPosition', 'ContextMeasure','GameID')


  return(GetData(endpoint, referer, ix, param.keys, source = 'NBA', ...))
}
