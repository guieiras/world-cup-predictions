class MatchesController < ApplicationController
  def index
    @matchdays = Matchday.includes(matches: [:home_team, :away_team, :stadium]).all
  end

  def show
    @match = MatchPresenter.new(Match.find(params[:id]))
  end
end
