class LeagueInvite < ApplicationRecord
  include Uuid

  belongs_to :inviter, class_name: "User"
  belongs_to :league
end
