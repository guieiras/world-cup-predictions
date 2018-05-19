class Admin::MatchesController < AdminController
  def index
    @matchdays = Matchday.all.includes(matches: [:home_team, :away_team])
    @teams = Team.all
  end

  def update
    match_params = params.require(:match).permit(:home_penalty, :away_penalty, :home_score, :away_score)
    match = Match.find(params[:id])

    ConsolidatePredictionResultsJob.perform_now(match.id) if match.update(match_params)
  end
end
