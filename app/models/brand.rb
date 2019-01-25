# frozen_string_literal: true

# == Schema Information
#
# Table name: brands
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Brand < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :name, presence: true, uniqueness: true, on: :create
end
