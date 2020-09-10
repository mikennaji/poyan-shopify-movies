# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "🧹 Cleaning database"
User.destroy_all

puts "🧑 Creating users"
poyan = User.create(email: "poyan@shopify.com", password: "123456")
mig = User.create(email: "miguel@shopify.com", password: "123456")
tashi = User.create(email: "tashi@shopify.com", password: "123456")
fukpui = User.create(email: "fukpui@shopify.com", password: "123456")
michelle = User.create(email: "michelle@shopify.com", password: "123456")

puts "Finished!"