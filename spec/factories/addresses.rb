# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id         :bigint(8)        not null, primary key
#  number     :integer
#  road       :string
#  zip_code   :integer
#  town       :string
#  state      :string
#  country    :string
#  profile_id :bigint(8)
#  billing    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :address do
    number { 1 }
    road { "MyString" }
    zip_code { 1 }
    town { "MyString" }
    state { "MyString" }
    country { "MyString" }
    profile { nil }
    billing { false }
  end
end
