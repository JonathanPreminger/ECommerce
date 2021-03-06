# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                  :bigint(8)        not null, primary key
#  name                :string
#  image_url           :string
#  description         :text
#  price               :decimal(7, 2)
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
  belongs_to :category
  belongs_to :brand
  has_many :cart_items, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :sizes, through: :stocks

  validates :price, presence: true, numericality: { greater_than: 0 }, on: :create
  validates :discount_percentage, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :name, presence: true, uniqueness: true, case_sensitive: false, format: { with: /\A[\x20-\x7E]+\z/, message: "Only alpha-numeric characters" }, length: { in: 3..30 }, on: :create
  validates :description, presence: true, length: { in: 10..500 }, on: :create
  validates :category, presence: true, on: :create
  validates :brand, presence: true, on: :create

  scope :alphabetical_order, -> { order(name: :asc) }
  scope :by_brand, ->(brand_id) { where brand_id: brand_id }
  scope :by_category, ->(category_id) { where category_id: category_id }

  def genre
    return "U" if male && female
    return "M" if male
    return "W" if female
  end

  def final_price
    has_discount ? (price * (1 - discount_percentage.to_f / 100)).round(2) : price
  end
end
