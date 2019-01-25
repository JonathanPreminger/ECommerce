# frozen_string_literal: true

# == Schema Information
#
# Table name: sizes
#
#  id         :bigint(8)        not null, primary key
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Size < ApplicationRecord
  validates :value, inclusion: { in: %w(S M L XL),
                                 message: "not a valid size" }, uniqueness: true, on: :create
end
