FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    username { Faker::Internet.unique.user_name }
    email { Faker::Internet.unique.email }
    avatar { Faker::Avatar.unique.image }
    password { Faker::Internet.unique.password }
  end
end
