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
    billing_address { Faker::Address.full_address }
    delivery_address { Faker::Address.full_address }
    association :user, factory: :user_confirmed
  end
end
