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

2.times do
  Faker::Config.locale = 'fr'
  doctor = Doctor.new(speciality: "cardiologie")
  doctor.save!
  User.create!(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name,
                email: Faker::Internet.email, password: "password", userable: doctor,
                phone_number: Faker::PhoneNumber.cell_phone_with_country_code)
end
