FactoryBot.define do
  factory :match do
    code 1
    association :home_team, factory: :team
    association :away_team, factory: :team
    home_score 1
    away_score 1
    home_penalty 1
    away_penalty 1
    stadium
    matchday
    datetime "2018-05-12 13:50:46"
    stage "round_1"
    match_type "group"
  end
end
