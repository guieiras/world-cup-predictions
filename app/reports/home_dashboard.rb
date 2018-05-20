class HomeDashboard
  def initialize(scope)
    @items = scope.to_a
  end

  def total_score
    @total_score ||= @items.inject(0) do |memo, prediction|
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
