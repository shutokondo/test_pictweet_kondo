FactoryGirl.define do
  factory :user do
    nickname { Faker::Lorem.characters(1..6) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
  end
end