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

20.times do
  Brand.create(name: Faker::Superhero.power)
end

Size.create(value: "S")
Size.create(value: "M")
Size.create(value: "L")
Size.create(value: "XL")

100.times do
  Item.create(name: Faker::Commerce.product_name, image_url: Faker::LoremPixel.image("100x100", false, 'fashion'),
              description: Faker::Lorem.sentence, price: rand(1..50), male: Faker::Boolean.boolean, female: Faker::Boolean.boolean,
              category_id: rand(Category.first.id..Category.last.id), brand_id: rand(1..20))
end

Stock.create(quantity: rand(1..10), item_id: rand(Item.first.id..Item.last.id), size_id: rand(Size.first.id..Size.last.id))
