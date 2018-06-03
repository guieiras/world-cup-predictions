class Team < ApplicationRecord
  def matches
    Match.where(home_team: self).or(Match.where(away_team: self))
  end
end
