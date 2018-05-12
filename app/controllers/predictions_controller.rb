class PredictionsController < ApplicationController
  def index
    @matches = Match.includes(:home_team, :away_team, :stadium).where(matchday: Matchday.available)
    @predictions = current_user.predictions.each_with_object({}) do |prediction, hash|
      hash[prediction.match_id] = prediction
    end
  end

  def create
    params["predictions"].permit!

    Prediction.transaction do
      params["predictions"].to_h.each do |match_id, prediction|
        Prediction
          .find_or_initialize_by(user: current_user, match_id: match_id.to_i)
          .update(home_score: prediction["home_score"], away_score: prediction["away_score"])
      end
    end

    redirect_to predictions_path
  end
end
