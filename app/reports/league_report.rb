class LeagueReport
  def initialize(league)
    @league = league
  end

  def leaderboard
    query.clone.map do |row|
      player = row.clone
      player.results = player.results.map { |match, prediction| prediction["score"] }

      player
    end
  end

  private
  def query
    @query ||= LeaderboardQuery.execute(league_id: @league.id).map do |player|
      player.results = JSON.parse(player.results)

      player
    end
  end
end
