class Match < ApplicationRecord
  belongs_to :home_team, class_name: "Team", optional: true
  belongs_to :away_team, class_name: "Team", optional: true
  belongs_to :stadium
  belongs_to :matchday

  has_many :predictions

  before_save :populate_finished

  scope :today, -> do
    where(arel_table[:datetime].between(
      Date.current.beginning_of_day..Date.current.end_of_day))
  end

  scope :predictable, -> do
    where(arel_table[:datetime].between(predictable_time))
      .where(finished: false)
      .where.not(home_team: nil, away_team: nil)
  end

  scope :closed, -> do
    where(arel_table[:datetime].lteq(PredictionSettings.close_time.from_now))
      .or(finished)
  end

  scope :finished, -> { where(finished: true) }

  def past?
    datetime < DateTime.current
  end

  def group?
    match_type == 'group'
  end

  def knockout?
    match_type == 'knockout'
  end

  def predictable?
    self.class.predictable_time.cover?(datetime) && !finished?
  end

  private
  def populate_finished
    self.finished = home_score.present? && away_score.present?
  end

  def self.predictable_time
    PredictionSettings.close_time.from_now..PredictionSettings.open_time.from_now
  end
end
