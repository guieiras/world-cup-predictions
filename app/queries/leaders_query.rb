class LeadersQuery < BaseQuery
  def schema
    [:player_id, :player_name, :total_score]
  end

  def build
    <<-SQL
SELECT u.id, u.name, COALESCE(sum(res.score), 0) total_score
FROM users u
LEFT JOIN predictions p ON u.id = p.user_id
LEFT JOIN prediction_results res ON p.id = res.prediction_id
GROUP BY u.id, u.name
ORDER BY total_score DESC
    SQL
  end
end
