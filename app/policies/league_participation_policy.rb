class LeagueParticipationPolicy < ApplicationPolicy
  def destroy?
    record.league.creator_id == user.id && record.user_id != user.id
  end
end
