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

class Address < ApplicationRecord
  belongs_to :profile

  scope :billing, -> { where(billing: true) }
  scope :delivery, -> { where(billing: false) }

  def readable
    "#{number} #{road} #{zip_code} #{town} #{state} (#{country})"
  end
end
