class Item < ApplicationRecord
  validates :price, presence: true, numericality: {greater_than: 0}, on: :create
  validates :discount_percentage, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :name, presence: true, format: {with: /\A[a-zA-Z0-9+\s]+\z/, message: "Only alpha-numeric characters"}, length: { in: 3..30 }, on: :create
  validates :description, presence: true, length: {in: 10..500, message: "Between 10 and 500 characters"}, on: :create
  belongs_to :category
  validates :category, presence: true, format: {with: /\A[a-zA-Z0-9+\s]+\z/, message: "Only alpha-numeric characters"}, length: { in: 3..30 }, on: :create
  belongs_to :brand
  validates :brand, presence: true, format: {with: /\A[a-zA-Z0-9+\s]+\z/, message: "Only alpha-numeric characters"}, length: { in: 3..30 }, on: :create
  has_many :cart_items, optional: true, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :sizes, through: :stocks
end
