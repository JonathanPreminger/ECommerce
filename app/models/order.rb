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
#

class Order < ApplicationRecord
  belongs_to :user
  validates :user, presence: true, on: :create
  has_many :cart_items, as: :line_item, dependent: :destroy
  validates :total, presence: true, numericality: { greater_than: 0 }, on: :create

  belongs_to :billing_address, class_name: "Address", foreign_key: "billing_id", inverse_of: :orders
  belongs_to :delivery_address, class_name: "Address", foreign_key: "delivery_id", inverse_of: :orders

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
    "#{user.profile.first_name} #{user.profile.last_name}"
  end
end
