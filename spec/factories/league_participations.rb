FactoryBot.define do
  factory :league_participation do
    user nil
    league nil
    invite { SecureRandom.uuid }
    active false
  end
end
