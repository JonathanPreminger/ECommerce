# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id         :bigint(8)        not null, primary key
#  total      :decimal(, )
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
  belongs_to :user
  validates :user, presence: true, on: :create
  has_many :cart_items, dependent: :destroy
  validates :total, presence: true, numericality: { greater_than: 0 }, on: :create
end
