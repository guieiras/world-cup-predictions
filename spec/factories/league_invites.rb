FactoryBot.define do
  factory :league_invite do
    email { Faker::Internet.email }
    association :inviter, factory: :user
    league
  end
end
