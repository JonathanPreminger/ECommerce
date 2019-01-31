# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Category.create(name: "Shirt")
Category.create(name: "Tee shirt")
Category.create(name: "Pull")
Category.create(name: "Trousers")
Category.create(name: "Coats")
Category.create(name: "Related products")

10.times do
  Brand.create!(name: Faker::Name.first_name)
end

Size.create(value: "S")
Size.create(value: "M")
Size.create(value: "L")
Size.create(value: "XL")

100.times do
  Item.create!(name: Faker::Lorem.characters(6), image_url: Faker::LoremPixel.image("100x100", false, 'fashion'),
               description: Faker::Lorem.sentence, price: rand(20..300), male: Faker::Boolean.boolean, female: Faker::Boolean.boolean,
               category_id: rand(Category.first.id..Category.last.id), brand_id: rand(1..Brand.count))
end

i = 1
while i <= Item.count
  Stock.create!(quantity: rand(1..10), item_id: i, size_id: rand(Size.first.id..Size.last.id))
  i += 1
end

Category.create(name: "kikou")
Brand.create(name: "lol")
Item.create(name: "maou", image_url: "http://is1.mzstatic.com/image/thumb/Purple49/v4/06/26/96/06269693-c065-caba-358c-deb859303797/source/256x256bb.jpg", price: 10, has_discount: true, male: true, discount_percentage: 50, category_id: 1, brand_id: 1, description: "youplaboum")
user = User.new(email: "juliette.a@gmail.com", password: "123456", password_confirmation: "123456")
user.skip_confirmation!
user.save
user.create_profile(first_name: "Juju", last_name: "Aud")
Address.create(number: 5, road: "rue du bonheur", zip_code: 30_000, town: "Nîmes", state: "Gard", country: "France", profile_id: Profile.first.id,  billing: true)
Address.create(number: 7, road: "rue du bonheur", zip_code: 30_000, town: "Nîmes", state: "Gard", country: "France", profile_id: Profile.first.id,  billing: false)
Order.create(user_id: User.first.id, total: 10.0, billing_id: Address.first.id, delivery_id: Address.last.id, status: false)