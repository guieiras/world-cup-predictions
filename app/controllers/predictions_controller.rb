class PredictionsController < ApplicationController
  skip_forgery_protection only: [:create]
  def index
    @predictions = current_user
                     .predictions
                     .joins(:match)
                     .order('matches.datetime ASC')
                     .includes(:result, match: [:home_team, :away_team])
  end

  def current
    @matches = Match.includes(:home_team, :away_team, :stadium).order('datetime ASC').predictable
    @predictions = current_user.predictions.where(match_id: @matches).each_with_object({}) do |prediction, hash|
      hash[prediction.match_id] = prediction
    end
  end

  def create
    prediction = permitted_params
    if prediction[:home].present? && prediction[:away].present?
      Prediction
        .find_or_initialize_by(user: current_user, match_id: prediction[:match].to_i)
        .update(home_score: prediction[:home], away_score: prediction[:away],
                home_penalty: prediction[:home_penalty], away_penalty: prediction[:away_penalty])

      return head :ok
    end
    head :unprocessable_entity
  end

  private

  def permitted_params
    params.permit('home', 'away', 'home_penalty', 'away_penalty', 'match')
  end
end
