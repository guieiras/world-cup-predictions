module MatchesHelper
  def match_score(match)
    if match.home_penalty || match.away_penalty
      "#{match.home_score} (#{match.home_penalty}) X (#{match.away_penalty}) #{match.away_score}"
    else
      "#{match.home_score} X #{match.away_score}"
    end
  end
end
