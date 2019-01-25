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

FactoryBot.define do
  factory :brand do
    name { Faker::SiliconValley.company }
  end
end
