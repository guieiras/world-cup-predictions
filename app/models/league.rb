class League < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :participations, class_name: 'LeagueParticipation'
  has_many :users, through: :participations

  validates_presence_of :name
end
