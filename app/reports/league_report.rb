class LeagueReport
  attr_reader :league

  def initialize(league)
    @league = league
  end

  def players
    @players ||= league.users.includes(predictions: :result)
  end

  def leaderboard
    scores.sort_by { |player| player.score }
  end

  def scores
    @consolidated_results ||= players.map do |player|
      scores = player.predictions.map(&:result).sort_by(&:created_at).map(&:score)
      OpenStruct.new(
        player: player,
        scores: scores,
        score: scores.reject(&:blank?).reduce(&:+)
      )
    end
  end
end
