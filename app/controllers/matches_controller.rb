class MatchesController < ApplicationController
  def index
    @matchdays = Matchday.includes(matches: [:home_team, :away_team, :stadium]).all
  end
end
