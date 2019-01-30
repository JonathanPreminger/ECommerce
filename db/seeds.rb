# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: "kikou")
Brand.create(name: "lol")
Item.create(name: "maou", image_url: "http://is1.mzstatic.com/image/thumb/Purple49/v4/06/26/96/06269693-c065-caba-358c-deb859303797/source/256x256bb.jpg", price: 10, has_discount: true, male: true, discount_percentage: 50, category_id: 1, brand_id: 1, description: "youplaboum")
