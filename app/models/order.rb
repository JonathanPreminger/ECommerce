# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  validates :user, presence: true, on: :create
  has_many :cart_items, dependent: :destroy
  validates :total, presence: true, numericality: { greater_than: 0 }, on: :create
end
