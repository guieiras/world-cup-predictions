class PredictionsController < ApplicationController
  def index
    @matches = Match.where(matchday: Matchday.available)
    @predictions = current_user.predictions
  end
end
