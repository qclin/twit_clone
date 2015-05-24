# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'pry'
User.destroy_all
Tweet.destroy_all
response = HTTParty.get("http://api.randomuser.me/?results=100")
response["results"].shuffle.each do |x|
  User.create({username: x["user"]["username"], email: x["user"]["email"], password: x["user"]["password"]})
end

users = User.all

50.times do 
  content = Faker::Lorem.sentences(2)
  users.each{ |user| user.tweets.create!(content: content)}
end 

