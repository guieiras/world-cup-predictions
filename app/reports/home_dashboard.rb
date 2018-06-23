class HomeDashboard
  attr_reader :user, :items, :predictions

  def initialize(user, scope)
    @user = user
    @items = scope.to_a
    @predictions = user
      .predictions
      .pluck(:match_id, :home_score, :away_score, :home_penalty, :away_penalty)
      .reduce({}) do |memo, prediction|
        memo[prediction[0]] = {
          home_score: prediction[1],
          away_score: prediction[2],
          home_penalty: prediction[3],
          away_penalty: prediction[4]
        }
        memo
      end
  end

  def leagues
    @leagues ||= user.leagues
  end

  def total_score
    @total_score ||= items.inject(0) do |memo, prediction|
      memo + (prediction.result&.score || 0)
    end
  end

  def score_evolution
    return @score_evolution if @score_evolution
    object = {}
    history =
      @items
        .sort_by { |item| item.match.datetime }
        .group_by { |item| item.match.datetime.to_date }

    object[:labels] = history.keys.map { |date| I18n.l(date) }
    object[:values] = history.values.map do |predictions|
      predictions.inject(0) do |memo, prediction|
        memo + (prediction.result&.score || 0)
      end
    end

    @score_evolution ||= OpenStruct.new(object)
  end
end
