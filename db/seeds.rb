# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'faker'
# users = []
# talks = []

# 10.times do
  # users << User.create(
    # email: Faker::Internet.email,
    # password: Faker::Internet.password(8)
  # )
# end

# 20.times do
  # talks << Talk.create(
    # topic: Faker::Lorem.words(2).join(' '),
    # date: Faker::Date.forward(rand(1..14)),
    # user_id: users.sample.id
  # )
# end

# 50.times do
  # Comment.create(
    # talk_id: talks.sample.id,
    # user_id: users.sample.id,
    # content: Faker::Lorem.sentence
  # )

# end

FillerWord.create(word: "[u,U]m+")
FillerWord.create(word: "[u,U]h+")
FillerWord.create(word: "[a,A]h{2,}")

