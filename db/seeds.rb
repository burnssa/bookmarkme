# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Create users
5.times do
	user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: "Asdf1234",
    password_confirmation: "Asdf1234"
  )
  user.save
end
users = User.all

 # Create Topics
 15.times do
   Topic.create(
   	user: 	users.sample,
    title:  Faker::Lorem.sentence,
    description:  Faker::Lorem.paragraph
   )
 end
 topics = Topic.all

# Create Bookmarks
50.times do 
	bookmark = Bookmark.create(
		user: 	users.sample,
		topic: 	topics.sample,
		description: 	Faker::Lorem.sentence,
		url:    Faker::Internet.url
		)	

  bookmark.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end
bookmarks = Bookmark.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Bookmark.count} bookmarks created"
puts "#{Topic.count} topics created"

