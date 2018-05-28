class LeagueInvitePolicy < ApplicationPolicy
  def create?
    user_is_league_creator? &&
      record.league.users.where(email: record.email).blank?
  end

  def destroy?
    user_is_league_creator?
  end

  private
  def user_is_league_creator?
    record.league.creator_id == user.id
  end
end
