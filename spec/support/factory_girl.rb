require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :talk do
    sequence(:topic) { |n| "Talk #{n}" }
    date "2015-10-11"
  end

end
