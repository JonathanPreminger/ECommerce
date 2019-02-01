# frozen_string_literal: true

# == Schema Information
#
# Table name: cart_items
#
#  id             :bigint(8)        not null, primary key
#  quantity       :integer          default(1)
#  item_id        :bigint(8)
#  size_id        :bigint(8)
#  line_item_type :string
#  line_item_id   :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryBot.define do
  factory :cart_item do
    quantity { Faker::Number.number(1) }
    item
    size
  end
end
