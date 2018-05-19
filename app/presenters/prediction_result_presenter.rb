class PredictionResultPresenter < SimpleDelegator
  attr_reader :match, :result

  def initialize(result, match)
    @result = result
    @match = match
    __setobj__(result)
  end

  def criteria
    result = {
      home_score: OpenStruct.new(hit?: home_score?),
      away_score: OpenStruct.new(hit?: away_score?),
      score_difference: OpenStruct.new(hit?: score_difference?)
    }

    if match.group?
      result[:game_winner] = OpenStruct.new(hit?: game_winner?)
    else
      result[:penalty_result] = OpenStruct.new(hit?: penalty_result?)
      result[:game_winner] = OpenStruct.new(hit?: game_winner?)
      result[:penalty_winner] = OpenStruct.new(hit?: penalty_winner?)
      result[:match_winner] = OpenStruct.new(hit?: match_winner?)
    end

    result
  end

  def score
    result ? result.score : 0
  end
end
