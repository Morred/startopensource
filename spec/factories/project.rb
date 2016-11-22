FactoryGirl.define do

  factory :project do
    name        { Faker::Internet.slug }
    url         { Faker::Internet.url('github.com', "/#{Faker::Internet.user_name}/#{name}") }
    description { Faker::Company.catch_phrase }
    email       { Faker::Internet.email }
  end
end
