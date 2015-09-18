FactoryGirl.define do
  factory :tweet do
    text "Hello World!!"
    image "http://dog.png"
    user
  end
end