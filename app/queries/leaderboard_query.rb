class LeaderboardQuery < BaseQuery
  def schema
    [:player_id, :player_name, :results, :total_score]
  end

  def build
    <<-SQL
SELECT u.id, u.name,
       CASE COUNT(p.id)
       WHEN 0 THEN '{}'::json
       ELSE
       json_object_agg(COALESCE(p.match_id, 0),
        json_object(
          ARRAY['home_score', 'away_score', 'home_penalty', 'away_penalty', 'score'],
          ARRAY[p.home_score::text, p.away_score::text, p.home_penalty::text, p.away_penalty::text, COALESCE(res.score, -1)::text]))
       END results,
       COALESCE(sum(res.score), 0) total_score
FROM users u
LEFT JOIN predictions p ON u.id = p.user_id
LEFT JOIN prediction_results res ON p.id = res.prediction_id
JOIN league_participations l ON u.id = l.user_id
WHERE l.league_id = #{payload.league_id}
GROUP BY u.id, u.name
ORDER BY total_score DESC
    SQL
  end
end
