class Predictions::ScoreCalculator
  def self.calculate result
    score = 0
    score += 1 if result.home_score?
    score += 1 if result.away_score?
    score += 1 if result.home_penalty?
    score += 1 if result.away_penalty?
    score += 1 if result.game_winner?
    score += 1 if result.score_difference?
    score += 1 if result.penalty_winner?
    score += 1 if result.match_winner?

    score
  end
end
