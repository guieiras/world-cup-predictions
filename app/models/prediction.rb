class Prediction < ApplicationRecord
  belongs_to :user
  belongs_to :match
  has_one :result, class_name: 'PredictionResult'

  validate :match_available?, if: -> { home_score_changed? || away_score_changed? }

  private
  def match_available?
    match.predictable?
  end
end
