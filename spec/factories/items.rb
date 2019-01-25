# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                  :bigint(8)        not null, primary key
#  name                :string
#  image_url           :string
#  description         :text
#  price               :decimal(7, 2)
#  has_discount        :boolean          default(FALSE)
#  male                :boolean
#  female              :boolean
#  discount_percentage :integer          default(0)
#  category_id         :bigint(8)
#  brand_id            :bigint(8)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryBot.define do
  factory :item do
    price { Faker::Number.decimal(3, 2) }
    name { Faker::SiliconValley.invention }
    image_url { Faker::SiliconValley.url }
    description { Faker::SiliconValley.quote }
    category
    brand

    trait :with_discount do
      has_discount { true }
    end

    trait :without_discount do
      has_discount { false }
    end

    trait :male_clothe do
      male { true }
      female { false }
    end

    trait :female_clothe do
      male { false }
      female { true }
    end

    trait :unisex do
      male { true }
      female { true }
    end

    factory :item_with_discount_male, traits: %i[with_discount male_clothe] do
      discount_percentage { Faker::Number.between(1, 100) }
    end

    factory :item_with_discount_female, traits: %i[with_discount female_clothe] do
      discount_percentage { Faker::Number.between(1, 100) }
    end

    factory :item_with_discount_unisex, traits: %i[with_discount unisex] do
      discount_percentage { Faker::Number.between(1, 100) }
    end

    factory :item_without_discount_male, traits: %i[without_discount male_clothe]

    factory :item_without_discount_female, traits: %i[without_discount female_clothe]

    factory :item_without_discount_unisex, traits: %i[without_discount unisex]

    factory :item_test do
      price { 10 }
      name { "Jeans" }
      image_url { Faker::SiliconValley.url }
      description { Faker::SiliconValley.quote }
      category
      brand
      has_discount { true }
      discount_percentage { 50 }
      male { true }
      female { false }
    end
  end
end
