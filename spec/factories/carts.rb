# frozen_string_literal: true
# == Schema Information
#
# Table name: carts
#
#  id         :bigint(8)        not null, primary key
#  total      :decimal(, )      default(0.0)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :cart do
    total { Faker::Number.decimal(4, 2) }
    association :user, factory: :user_confirmed
  end
end
