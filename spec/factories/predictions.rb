FactoryBot.define do
  factory :prediction do
    user
    match
    home_score 1
    away_score 1
    home_penalty 1
    away_penalty 1
  end
end
