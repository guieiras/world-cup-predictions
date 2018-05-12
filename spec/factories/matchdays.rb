FactoryBot.define do
  factory :matchday do
    code 1
    started_at { DateTime.current }
    ended_at { 1.week.from_now }
  end
end
