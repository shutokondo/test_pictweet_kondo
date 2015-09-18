FactoryGirl.define do
  factory :user do
    nickname { Faker::Lorem.characters(6) }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end