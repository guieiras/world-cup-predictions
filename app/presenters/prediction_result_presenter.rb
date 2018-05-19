class PredictionResultPresenter < SimpleDelegator
  attr_reader :result

  def initialize(result)
    @result = result
    __setobj__(result)
  end

  def successes
    return [] if result.nil?
    [].tap do |criteria|
      criteria << :home_score if home_score?
      criteria << :away_score if away_score?
      criteria << :game_winner if game_winner?
      criteria << :score_difference if score_difference?
      criteria << :penalty_result if penalty_result?
      criteria << :penalty_winner if penalty_winner?
      criteria << :match_winner if match_winner?
    end
  end

  def score
    result ? result.score : 0
  end
end
