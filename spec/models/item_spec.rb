# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                  :bigint(8)        not null, primary key
#  name                :string
#  image_url           :string
#  description         :text
#  price               :decimal(7, 2)    not null
#  has_discount        :boolean          default(FALSE)
#  male                :boolean
#  female              :boolean
#  discount_percentage :integer          default(0)
#  category_id         :bigint(8)
#  brand_id            :bigint(8)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
