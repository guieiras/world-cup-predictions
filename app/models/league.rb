class League < ApplicationRecord
  include Uuid

  belongs_to :creator, class_name: 'User'
  has_many :participations, class_name: 'LeagueParticipation'
  has_many :users, through: :participations
  has_many :invites, class_name: 'LeagueInvite'

  validates_presence_of :name
end
