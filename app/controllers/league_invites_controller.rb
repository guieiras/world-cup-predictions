class LeagueInvitesController < ApplicationController
  def create
    league = League.find_by(uuid: params[:league_id])
    invite = LeagueInvite.new(
              inviter: current_user,
              league: league,
              email: params[:user_email],
              uuid: SecureRandom.uuid)

    authorize invite
    invite.save
    flash[:success] = I18n.t('league_invites.actions.created')
    redirect_to league_members_path league.uuid
  end

  def destroy
    invite = LeagueInvite.find_by(uuid: params[:id])

    authorize invite
    flash[:success] = I18n.t('league_invites.actions.destroyed') if invite.destroy
    redirect_to league_members_path league.uuid
  end
end
