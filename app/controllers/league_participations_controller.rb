class LeagueParticipationsController < ApplicationController
  def destroy
    participation = LeagueParticipation.find params[:id]
    league = participation.league

    authorize participation
    participation.destroy

    flash[:success] = I18n.t('league_participations.destroy.success')
    redirect_to edit_league_path league.uuid
  end
end
