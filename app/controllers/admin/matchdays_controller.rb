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

    params['matches'].permit!
    Match.transaction do
      params['matches'].each do |match_id, match_score|
        Match.where(id: match_id).update(match_score)
      end
    end

    redirect_to action: "index"
  end
end
