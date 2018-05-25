class Predictions::ScoreCalculator
  def self.calculate result
    score = 0
    score += ScoreSettings.home_score if result.home_score?
    score += ScoreSettings.away_score if result.away_score?
    score += ScoreSettings.game_winner if result.game_winner?
    score += ScoreSettings.score_difference if result.score_difference?
    score += ScoreSettings.penalty_result if result.penalty_result?
    score += ScoreSettings.penalty_winner if result.penalty_winner?
    score += ScoreSettings.match_winner if result.match_winner?

    score
  end
end
