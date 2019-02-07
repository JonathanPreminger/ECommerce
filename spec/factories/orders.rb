# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id               :bigint(8)        not null, primary key
#  total            :decimal(, )
#  user_id          :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  status           :boolean          default(FALSE)
#  billing_address  :text
#  delivery_address :text
#  first_name       :text
#  last_name        :text
#

FactoryBot.define do
  factory :order do
    total { Faker::Number.between(1, 100) }
    status { Faker::Boolean.boolean }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    billing_address { Faker::Address.full_address }
    delivery_address { Faker::Address.full_address }
    association :user, factory: :user_confirmed

    trait :to_be_treated do
      status { false }
    end

    trait :treated do
      status { true }
    end

    factory :order_to_be_treated, traits: %i[to_be_treated]
    factory :order_treated, traits: %i[treated]
  end
end
