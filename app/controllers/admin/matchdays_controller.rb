class Admin::MatchdaysController < AdminController
  def index
    @matchdays = Matchday.all
  end

  def edit
    @matchday = Matchday.find(params[:id])
    @matches = Match.includes(:home_team, :away_team, :stadium).where(matchday: @matchday)
    @teams = Team.all
  end
end
