class Predictions::ScoreCalculator
  def self.calculate result
    score = 0
    score += Setting['score.home_score'] if result.home_score?
    score += Setting['score.away_score'] if result.away_score?
    score += Setting['score.game_winner'] if result.game_winner?
    score += Setting['score.score_difference'] if result.score_difference?
    score += Setting['score.penalty_result'] if result.penalty_result?
    score += Setting['score.penalty_winner'] if result.penalty_winner?
    score += Setting['score.match_winner'] if result.match_winner?

    score
  end
end
