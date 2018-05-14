class Admin::MatchdaysController < AdminController
  def index
    @matchdays = Matchday.all
  end

  def edit
    @matchday = Matchday.find(params[:id])
    @matches = Match.includes(:home_team, :away_team, :stadium).where(matchday: @matchday)
    @teams = Team.all
  end

  def update
    @matchday = Matchday.find(params[:id])
    @matchday.update(params.require(:matchday).permit(:started_at, :ended_at))

    redirect_to action: "index"
  end
end
