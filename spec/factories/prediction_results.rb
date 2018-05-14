FactoryBot.define do
  factory :prediction_result do
    prediction
    home_score false
    away_score false
    home_penalty false
    away_penalty false
    game_winner false
    penalty_winner false
    match_winner false
    score_difference false
    score 10
  end
end
