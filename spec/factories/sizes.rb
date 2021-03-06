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

FactoryBot.define do
  factory :size do
    value { ["S", "M", "L", "XL"].sample }
  end
end
