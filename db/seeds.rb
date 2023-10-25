# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(
  email: 'sg.3230gaigai@gmail.com',
  password: 'mikumikumikuku'
)


Customer.create!(
  email:"aaa@gmail.com",
  password:"aaaaaa",
  first_name:"aaaa",
  last_name:"aaaaa",
  first_name_kana:"aaaa",
  last_name_kana:"aaaaaa",
  postal_code:"aaaaa",
  address:"aaaaaaa",
  telephone_number:"aaaaa"
);

