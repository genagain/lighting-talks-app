require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    emcee "2015-01-01"
  end

  factory :talk do
    sequence(:topic) { |n| "Talk #{n}" }
    date "2015-10-07"
    video_url ""
  end

  factory :comment do
    content 'Great job!'
    talk
    user_id 1
  end

end
