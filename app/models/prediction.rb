class Prediction < ApplicationRecord
  belongs_to :user
  belongs_to :match

  validate :matchday_is_available, if: -> { home_score_changed? || away_score_changed? }

  private
  def matchday_is_available
    match.matchday.available?
  end
end
