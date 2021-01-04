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

# Create a main sample coach.
coach = Coach.create!(name: "Mike",
                      email: "mikecoach@mail.org",
                      password: "password",
                      password_confirmation: "password")
            
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
# Random schedules for coaches
schedule1 = Coach.first.schedule
schedule1.update(
  monday: ["7", "8", "9", "10", "11", "16", "17", "18", "19", "20"],
  tuesday: ["9", "10", "11", "12", "13"],
  wednesday: ["7", "8", "9", "15", "16", "17", "18", "19"],
  thursday: ["17", "18", "19", "20", "21"],
  friday: ["7", "8", "9", "10", "11", "16", "17", "18", "19", "20"],
  saturday: ["10", "11", "12"],
  sunday: ["16", "17", "18"]
)
schedule2 = Coach.second.schedule
schedule2.update(
  monday: ["17", "18", "19", "20", "21"],
  tuesday: ["7", "8", "9", "10", "14", "15"],
  wednesday: ["15", "16", "17", "18", "19", "20"],
  thursday: ["7", "8", "9", "10", "11", "12"],
  friday: ["15", "16", "17"],
  saturday: ["8", "9", "10", "11", "12"],
  sunday: ["11", "12", "13"]
)
schedule3 = Coach.third.schedule
schedule3.update(
  monday: ["7", "8", "9", "10"],
  tuesday: ["13", "14", "15", "16", "17"],
  wednesday: ["7", "8", "9", "10", "11", "12"],
  thursday: ["7", "8", "9", "10", "11", "12"],
  friday: ["17", "18", "19", "20", "21"],
  saturday: ["9", "10", "11"],
  sunday: ["9", "10", "11"]
)
schedule4 = Coach.fourth.schedule
schedule4.update(
  monday: ["17", "18", "19", "20", "21"],
  tuesday: ["17", "18", "19", "20", "21"],
  wednesday: ["10", "11", "12", "13", "14", "15"],
  thursday: ["10", "11", "12", "13", "14", "15"],
  friday: ["12", "13", "14"],
  saturday: ["12", "13", "14"],
  sunday: ["12", "13", "14"]
)
schedule5 = Coach.fifth.schedule
schedule5.update(
  monday: ["9", "10", "11", "12", "13", "14", "20", "21"],
  tuesday: ["20", "21"],
  wednesday: ["7", "8", "19", "20", "21"],
  thursday: ["7", "8", "9", "10", "11", "12"],
  friday: ["18", "19", "20", "21"],
  saturday: ["8", "9", "10", "11", "12"],
  sunday: ["12", "13"]
)
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
