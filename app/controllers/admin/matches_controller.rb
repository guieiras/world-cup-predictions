class Admin::MatchesController < AdminController
  def index
    @matchdays = Matchday.all.includes(matches: [:home_team, :away_team])
    @teams = Team.all
  end

  def update
    match_params = params
      .require(:match)
      .permit(:home_penalty, :away_penalty, :home_score, :away_score, :home_team_id, :away_team_id)
    match = Match.find(params[:id])

    if match.update(match_params) && match.home_score.present? && match.away_score.present?
      ConsolidatePredictionResultsJob.perform_now(match.id)
    end
  end
end
