class LeaguesController < ApplicationController
  def index
    @leagues = current_user.leagues.includes(:creator)
  end

  def show
    @league = League.find_by(uuid: params[:id])
    @leaderboard = LeaderboardQuery.execute(league_id: @league.id)
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(params.require(:league).permit(:name, :description))

    ActiveRecord::Base.transaction do
      if @league.update(creator: current_user, uuid: SecureRandom.uuid)
        LeagueParticipation.create(league: @league, user: current_user, invite: SecureRandom.uuid, active: true)
        redirect_to root_path
      else
        render 'new'
      end
    end
  end
end
