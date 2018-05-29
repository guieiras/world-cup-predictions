class LeagueInvitesController < ApplicationController
  skip_before_action :require_login, only: [:show]

  def show
    @invite = LeagueInvite.find_by_uuid params[:id]
    authorize @invite
    redirect_to sign_up_path(invite: @invite.uuid) if current_user.nil?
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

  def accept
    invite = LeagueInvite.find_by_uuid params[:league_invite_id]
    authorize invite
    league = invite.league
    ActiveRecord::Base.transaction do
      LeagueParticipation.create(league: league, user: current_user)
      invite.destroy
    end
    flash[:success] = I18n.t('league_invites.actions.accepted')
    redirect_to league_path league.uuid
  end

  def refuse
    invite = LeagueInvite.find_by_uuid params[:league_invite_id]
    authorize invite
    invite.destroy
    flash[:success] = I18n.t('league_invites.actions.refused')
    redirect_back(fallback_location: root_path)
  end
end
