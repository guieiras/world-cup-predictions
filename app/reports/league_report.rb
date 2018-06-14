class LeagueReport
  def initialize(league)
    @league = league
  end

  def query
    @query ||= LeaderboardQuery.execute(league_id: @league.id).map do |player|
      player.results = JSON.parse(player.results)

      player
    end
  end

  def predictions
    @predictions ||= matches.map do |match|
      OpenStruct.new(
        id: match.id,
        match: MatchPresenter.new(match),
        predictions: query.map do |player|
          values = player.results[match.id.to_s] || {}
          {
            player_name: player.player_name,
            values: MatchPresenter.new(OpenStruct.new(values)),
            score: values['score'].blank? ? -2 : values['score'].to_i
          }
        end.sort_by { |prediction| - prediction[:score] }
      )
    end
  end

  def leaderboard_history
    @history ||= -> {
      labels = matches.where(finished: true)
                .to_a.pluck(:id, :datetime)
                .inject({}) do |memo, match|
                  date = I18n.l(match[1].to_date)
                  memo[date] ||= []
                  memo[date] << match[0].to_s
                  memo
                end
      results = query.map do |player|
        { name: player.player_name,
          dataset: player.results.to_a.map do |result|
                      [result[0], result[1]["score"]]
                    end.to_h
        }
      end

      {
        labels: labels.keys,
        datasets: results.map do |player|
          {
            label: player[:name],
            data: labels.values.map do |date|
              date.map { |match_id| player[:dataset][match_id] }.sum
            end
          }
        end
      }
    }.call
  end

  private

  def matches
    @matches ||= Match.includes(:home_team, :away_team).closed.order(:datetime)
  end
end
