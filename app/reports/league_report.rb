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

  def predictions
    @predictions ||= matches.map do |match|
      OpenStruct.new(
        id: match.id,
        match: MatchPresenter.new(match),
        predictions: query.map do |player|
          values = player.results[match.id.to_s] || {}
          {
            player_name: player.player_name,
            values: MatchPresenter.new(OpenStruct.new(values)),
            score: values['score']
          }
        end.sort_by { |prediction| - (prediction[:score] || -1) }
      )
    end
  end

  private
  def query
    @query ||= LeaderboardQuery.execute(league_id: @league.id).map do |player|
      player.results = JSON.parse(player.results)

      player
    end
  end

  def matches
    @matches ||= Match.includes(:home_team, :away_team).closed
  end
end
