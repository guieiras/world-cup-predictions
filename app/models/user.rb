class User < ApplicationRecord
  include Clearance::User

  has_many :predictions
  has_many :participations, class_name: 'LeagueParticipation'
  has_many :leagues, through: :participations
end
