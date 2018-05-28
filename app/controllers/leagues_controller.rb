class LeaguesController < ApplicationController
  def index
    @leagues = current_user.leagues.includes(:creator)
  end

  def show
    @league = League.find_by(uuid: params[:id])
    @report = LeagueReport.new(@league)
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(params.require(:league).permit(:name, :description))

    ActiveRecord::Base.transaction do
      if @league.update(creator: current_user, uuid: SecureRandom.uuid)
        LeagueParticipation.create(league: @league, user: current_user)
        redirect_to league_path @league.uuid
      else
        render 'new'
      end
    end
  end

  def members
    @league = League.find_by(uuid: params[:league_id])
    unless current_user.admin? || @league.creator == current_user
      raise ActionController::RoutingError.new('Unauthorized User')
    end
    @participations = @league.participations.includes(:user)
  end
end
