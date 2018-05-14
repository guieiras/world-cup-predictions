class Match < ApplicationRecord
  belongs_to :home_team, class_name: "Team", optional: true
  belongs_to :away_team, class_name: "Team", optional: true
  belongs_to :stadium
  belongs_to :matchday

  def past?
    datetime < DateTime.current
  end
end
