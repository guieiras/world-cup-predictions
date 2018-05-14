class Admin::MatchdaysController < AdminController
  def index
    @matchdays = Matchday.all
  end

  def edit
    @matchday = Matchday.find(params[:id])
    @matches = Match.includes(:home_team, :away_team).where(matchday: @matchday)
    @teams = Team.all
  end

  def update
    @matchday = Matchday.find(params[:id])
    @matchday.update(params.require(:matchday).permit(:started_at, :ended_at))

    params['matches'].permit!
    Match.transaction do
      params['matches'].each do |match_id, match_score|
        match = Match.find(match_id)
        match.assign_attributes(match_score.to_h)

        if match.changed?
          match.save
        end
      end
    end

    redirect_to action: "index"
  end
end
