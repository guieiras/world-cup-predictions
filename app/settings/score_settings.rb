class ScoreSettings
  def self.home_score
    Setting['score.home_score'].to_i
  end

  def self.away_score
    Setting['score.away_score'].to_i
  end

  def self.game_winner
    Setting['score.game_winner'].to_i
  end

  def self.score_difference
    Setting['score.score_difference'].to_i
  end

  def self.penalty_result
    Setting['score.penalty_result'].to_i
  end

  def self.penalty_winner
    Setting['score.penalty_winner'].to_i
  end

  def self.match_winner
    Setting['score.match_winner'].to_i
  end
end
