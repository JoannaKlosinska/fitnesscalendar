# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a main sample customer.
customer = Customer.create!(name: "Sample User",
                        email: "sampleuser@mail.org",
                        password: "foobar",
                        password_confirmation: "foobar")
customer.skip_confirmation!
customer.save!

# Create a main sample coach.
coach = Coach.create!(name: "Mike",
                      email: "mikecoach@mail.org",
                      password: "password",
                      password_confirmation: "password")
coach.skip_confirmation!
coach.save!
            
# Generate a bunch of additional customers.
30.times do |n|
  name = Faker::Name.name
  email = "sample-#{n+1}@mail.org"
  password = "password"
  Customer.create!(
    name: name, 
    email: email,
    password: password,
    password_confirmation: password
  )
end

5.times do |n|
  name = Faker::Name.name
  email = "coach-#{n+1}@mail.org"
  password = "password"
  Coach.create!(
    name: name, 
    email: email,
    password: password,
    password_confirmation: password
  )
end

# Bookings
20.times do |b|
  day = Time.zone.today + (1..20).to_a.sample.days
  time = day + (8..16).to_a.sample.hours
  customer_id = Customer.pluck(:id).sample
  coach_id = Coach.pluck(:id).sample

  Booking.create!(
    time: time,
    customer_id: customer_id,
    coach_id: coach_id
  )
end
