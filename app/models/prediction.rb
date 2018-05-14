class Prediction < ApplicationRecord
  belongs_to :user
  belongs_to :match
  has_one :result, class_name: 'PredictionResult'

  validate :matchday_available?, if: -> { home_score_changed? || away_score_changed? }

  private
  def matchday_available?
    match.matchday.available?
  end
end
