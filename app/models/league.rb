class League < ApplicationRecord
  include Uuid

  belongs_to :creator, class_name: 'User'
  has_many :participations, class_name: 'LeagueParticipation', dependent: :destroy
  has_many :invites, class_name: 'LeagueInvite', dependent: :destroy
  has_many :users, through: :participations

  validates_presence_of :name
end
