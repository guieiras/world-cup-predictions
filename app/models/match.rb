class Match < ApplicationRecord
  belongs_to :home_team, class_name: "Team", optional: true
  belongs_to :away_team, class_name: "Team", optional: true
  belongs_to :stadium
  belongs_to :matchday

  has_many :predictions

  before_save :populate_finished

  scope :predictable, -> do
    where(arel_table[:datetime].between(predictable_time))
      .where(finished: false)
      .where.not(home_team: nil, away_team: nil)
  end

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
    close_time = Setting['predictions.hours_before_game_to_close'].to_i.hours.from_now
    open_time = Setting['predictions.hours_before_game_to_open'].to_i.hours.from_now

    close_time..open_time
  end
end
