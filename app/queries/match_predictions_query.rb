class MatchPredictionsQuery < BaseQuery
  def schema
    [:user_name, :league, :home_score, :away_score, :home_penalty, :away_penalty, :score]
  end

  def build
    <<-SQL
SELECT users.name, json_build_object(leagues.id, leagues.name), predictions.home_score, predictions.away_score, predictions.home_penalty, predictions.away_penalty, result.score
FROM league_participations participation
JOIN leagues ON participation.league_id = leagues.id
JOIN users ON participation.user_id = users.id
JOIN predictions ON predictions.user_id = users.id
LEFT JOIN prediction_results result ON result.prediction_id = predictions.id
WHERE predictions.match_id = #{payload.match_id} AND league_id IN (SELECT league_id FROM league_participations WHERE user_id = #{payload.user_id})
ORDER BY league_id ASC, score DESC, home_score, away_score, name
    SQL
  end
end
