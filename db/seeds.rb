# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Attendance.destroy_all

#Creation User
20.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(email: "#{first_name.downcase}.#{last_name.downcase}@yopmail.com", first_name: first_name,last_name: last_name, description: Faker::Lorem.sentence(word_count: 12))
end
tp User.all

#Creation Event
5.times do
  Event.create(start_date: Faker::Date.forward, duration: rand(1..60)*5, title: Faker::Lorem.sentence(word_count: 5), description: Faker::Lorem.sentence(word_count: 12), price: rand(1..1000), location: Faker::Address.full_address)
end
tp Event.all

#Creation Attendance
10.times do
  Attendance.create(user: User.all.sample, event: Event.all.sample)
end
tp Attendance.all