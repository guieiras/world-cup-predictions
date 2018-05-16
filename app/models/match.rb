class Match < ApplicationRecord
  belongs_to :home_team, class_name: "Team", optional: true
  belongs_to :away_team, class_name: "Team", optional: true
  belongs_to :stadium
  belongs_to :matchday

  has_many :predictions

  before_save :populate_finished

  scope :predictable, -> do
    where(arel_table[:datetime].between(5.days.ago..5.hours.ago))
      .where.not(home_team: nil, away_team: nil)
  end

  def past?
    datetime < DateTime.current
  end

  private
  def populate_finished
    self.finished = home_score.present? && away_score.present?
  end
end
