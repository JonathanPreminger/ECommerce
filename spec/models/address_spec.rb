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

require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
