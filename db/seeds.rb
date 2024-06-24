# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'open-uri'

# Appointment.destroy_all
Doctor.destroy_all
Patient.destroy_all
User.destroy_all

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")

7.times do
  Faker::Config.locale = 'fr'
  # Create doctor
  doctor = Doctor.new(speciality: Doctor::SPECIALITY.sample)
  doctor.save!
  user = User.new(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name,
                email: Faker::Internet.email, password: "password", userable: doctor,
                phone_number: Faker::PhoneNumber.cell_phone_with_country_code)
  user.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  user.save!

  #Create Patient
  patient = Patient.new(gender: Patient::GENDER.sample, birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
                        address: Faker::Address.street_address, zipcode: Faker::Address.zip_code ,city:Faker::Address.city )
  User.create!(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name,
               email: Faker::Internet.email, password: "password", userable: patient,
               phone_number: Faker::PhoneNumber.cell_phone_with_country_code)
end
