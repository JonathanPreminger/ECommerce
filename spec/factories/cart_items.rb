# frozen_string_literal: true

# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint(8)        not null, primary key
#  quantity   :integer          default(1)
#  cart_id    :bigint(8)
#  item_id    :bigint(8)
#  size_id    :bigint(8)
#  order_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


FactoryBot.define do
  factory :cart_item do
  end
end
