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

class CartItem < ApplicationRecord
  include CartTotal

  belongs_to :item
  belongs_to :line_item, polymorphic: true
  belongs_to :size

  validates :item, presence: true, on: :create
  validates :size, presence: true, on: :create
end
