class LeagueInvitesController < ApplicationController
  def show
    redirect_to root_path
  end

  def create
    league = League.find_by_uuid params[:league_id]
    invite = LeagueInvite.new(
              inviter: current_user,
              league: league,
              email: params[:user_email])

    authorize invite
    invite.save
    LeagueInviteMailer.with(invite: invite).welcome.deliver_now
    flash[:success] = I18n.t('league_invites.actions.created')
    redirect_to league_members_path league.uuid
  end

  def destroy
    invite = LeagueInvite.find_by_uuid params[:id]
    league = invite.league

    authorize invite
    flash[:success] = I18n.t('league_invites.actions.destroyed') if invite.destroy
    redirect_to league_members_path league.uuid
  end
end
