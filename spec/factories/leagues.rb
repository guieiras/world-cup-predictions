FactoryBot.define do
  factory :league do
    name "AwesomeLeague"
    description "My awesome League"
    association :creator, factory: :user
    uuid { SecureRandom.uuid }
  end
end
