class Predictions::ScoreConsolidator
  attr_reader :match, :predictions

  def initialize match
    @match = match
    @predictions = match.predictions
  end

  def consolidate
    PredictionResult.transaction do
      predictions.each do |prediction|
        result = prediction.build_result
        result.home_score = correct_home_score? prediction
        result.away_score = correct_away_score? prediction
        result.game_winner = correct_game_winner? prediction
        result.score_difference = correct_score_difference? prediction
        result.penalty_result = correct_penalty_result? prediction
        result.penalty_winner = correct_penalty_winner? prediction
        result.match_winner = correct_match_winner? prediction

        result.score = Predictions::ScoreCalculator.calculate(result)
        result.save
      end
    end
  end

  private

  def correct_home_score? prediction
    match.home_score == prediction.home_score
  end

  def correct_away_score? prediction
    match.away_score == prediction.away_score
  end

  def correct_penalty_result? prediction
    match.home_penalty.present? &&
      match.away_penalty.present? &&
      match.home_penalty == prediction.home_penalty &&
      match.away_penalty == prediction.away_penalty
  end

  def correct_game_winner? prediction
    match_winner = match.home_score <=> match.away_score
    prediction_winner = prediction.home_score <=> prediction.away_score

    match_winner == prediction_winner
  end

  def correct_score_difference? prediction
    (match.home_score - match.away_score) == (prediction.home_score - prediction.away_score)
  end

  def correct_penalty_winner? prediction
    match_winner = match.home_penalty <=> match.away_penalty
    prediction_winner = prediction.home_penalty <=> prediction.away_penalty

    match.home_penalty.present? &&
      match.away_penalty.present? &&
      match_winner == prediction_winner
  end

  def correct_match_winner? prediction
    match_winner = (match.home_score <=> match.away_score) + ((match.home_penalty <=> match.away_penalty) || 0)
    prediction_winner = (prediction.home_score <=> prediction.away_score) + ((prediction.home_penalty <=> prediction.away_penalty) || 0)

    match_winner == prediction_winner
  end
end
