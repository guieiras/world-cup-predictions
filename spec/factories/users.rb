FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    avatar { Faker::Avatar.unique.image }
    password { Faker::Internet.unique.password }
  end
end
