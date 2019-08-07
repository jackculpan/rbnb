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

user = User.create!(first_name: 'Jack', last_name: 'Culpan', email: 'bigj@gmail.com', password: '111111', admin: true, business: true)
pool = Pool.create!(user_id: user.id, name: 'Jacks big pool', location: 'Surrey', price: 20, number_of_people: 5, description: 'Good', photo: "texttest")
booking = Booking.create!(user_id: user.id, pool_id: pool.id, total_amount: 45, start_date: "20190801", end_date: "20190808")
review = Review.create!(content: "Wow amazing pool", booking_id: booking.id, rating: 5)
pool = Pool.create!(user_id: User.first.id, name: 'Jacks big pool', location: 'Surrey', price: 20, number_of_people: 5, description: 'Good', photo: "texttest")

