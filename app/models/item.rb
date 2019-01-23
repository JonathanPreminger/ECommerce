# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                  :bigint(8)        not null, primary key
#  name                :string
#  image_url           :string
#  description         :text
#  price               :decimal(7, 2)    not null
#  has_discount        :boolean          default(FALSE)
#  male                :boolean
#  female              :boolean
#  discount_percentage :integer          default(0)
#  category_id         :bigint(8)
#  brand_id            :bigint(8)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Item < ApplicationRecord
  validates :price, presence: true, numericality: { greater_than: 0 }, on: :create
  validates :discount_percentage, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :name, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9+\s]+\z/, message: "Only alpha-numeric characters" }, length: { in: 3..30 }, on: :create
  validates :description, presence: true, length: { in: 10..500, message: "Between 10 and 500 characters" }, on: :create
  belongs_to :category
  validates :category, presence: true, on: :create
  belongs_to :brand
  validates :brand, presence: true, on: :create
  has_many :cart_items, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :sizes, through: :stocks
end
