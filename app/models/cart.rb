# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id         :bigint(8)        not null, primary key
#  total      :decimal(, )
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  include CartTotal
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
  belongs_to :user
  validates :user, presence: true, on: :create
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }, on: :create
end
