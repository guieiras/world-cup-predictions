class LeaguePolicy < ApplicationPolicy
  def show?
    user.admin? || record.participations.where(user_id: user.id).present?
  end

  def edit?
    record.creator_id == user.id
  end
end
