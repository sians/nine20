# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

laurie = User.new(email: "organic.almonds@gmail.com", password: "foobar", first_name: "Laurie", last_name: "Gerhardt")
if laurie.save
  puts "saved Laurie!"
end

