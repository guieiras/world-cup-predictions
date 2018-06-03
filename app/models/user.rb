class User < ApplicationRecord
  include Clearance::User

  has_many :predictions
  has_many :participations, class_name: 'LeagueParticipation'
  has_many :invites, class_name: 'LeagueInvite', primary_key: 'email', foreign_key: 'email'
  has_many :leagues, through: :participations

  scope :by_email, ->(email) { where(email: email) }

  validates_presence_of :name
end
