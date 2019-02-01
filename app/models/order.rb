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

class Order < ApplicationRecord
  belongs_to :user
  has_many :cart_items, as: :line_item, dependent: :destroy

  validates :billing_address, presence: true, on: :create
  validates :delivery_address, presence: true, on: :create
  validates :user, presence: true, on: :create
  validates :total, presence: true, numericality: { greater_than: 0 }, on: :create

  scope :to_be_treated, -> { where(status: false) }
  scope :treated, -> { where(status: true) }

  def self.last_3_orders
    to_be_treated.order('created_at DESC').limit(3)
  end

  def number_of_items
    sum = 0
    cart_items.each do |object|
      sum += object.quantity
    end
    sum
  end

  def user_name
    "#{first_name} #{last_name}"
  end
end
