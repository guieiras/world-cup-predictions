class LeagueParticipationsController < ApplicationController
  def create
    @league = League.find_by_uuid: params[:league_id]

    redirect_to league_path @league.uuid
  end
end
