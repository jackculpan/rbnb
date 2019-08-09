# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Deleting all files"
Review.destroy_all if Rails.env.development?
Booking.destroy_all if Rails.env.development?
Pool.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?
puts "done delete"

require 'faker'

User.create!(first_name: 'Jack', last_name: 'Culpan', email: 'jackculpan@me.com', password: '111111', admin: true, business: true)
User.create!(first_name: 'Rahul', last_name: 'Suvarna', email: 'rahulsuvarna18@gmail.com
', password: '111111', admin: false, business: false)
User.create!(first_name: 'Nicolas', last_name: 'TOULEMONDE', email: 'n.toulemonde@tbs-education.org
', password: '111111', admin: true, business: true)



# 10.times {
#   User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '111111', admin: false, business: [true,false].sample)
#   Pool.create!(user_id: User.find([1..10].sample), name: "#{Faker::Address.street_address} Pool", location: Faker::Address, latitude: 51.5074, longitude: 0.1278, price: 20, number_of_people: 5, description: 'Good', photo: "https://res.cloudinary.com/dyigdenkz/image/upload/v1564734497/zl4c5tx78taeasjk8eux.jpg")
#   Booking.create!(user_id: user.id, pool_id: pool.id, total_amount: 45, start_date: "20190801", end_date: "20190808")
#   Review.create!(content: "Wow amazing pool", booking_id: booking.id, rating: 5)
# }

