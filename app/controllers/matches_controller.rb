class MatchesController < ApplicationController
  def index
    @days = Match.order(datetime: :asc)
                 .includes(:matchday, :home_team, :away_team, :stadium)
                 .all
                 .group_by { |match| match.datetime.to_date }
  end

  def show
    @match = MatchPresenter.new(Match.find(params[:id]))
  end

  def details
    @match = MatchPresenter.new(Match.find(params[:match_id]))
    @predictions = MatchPredictionsQuery.execute(match_id: @match.id, user_id: current_user.id)
  end
end
