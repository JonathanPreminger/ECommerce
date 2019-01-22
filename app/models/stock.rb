# frozen_string_literal: true

# == Schema Information
#
# Table name: stocks
#
#  id         :bigint(8)        not null, primary key
#  quantity   :integer
#  item_id    :bigint(8)
#  size_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stock < ApplicationRecord
  belongs_to :item
  validates :item, presence: true, on: :create
  belongs_to :size
  validates :size, presence: true, on: :create
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }, on: :create
end
