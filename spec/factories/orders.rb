# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id          :bigint(8)        not null, primary key
#  total       :decimal(, )
#  user_id     :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :boolean          default(FALSE)
#  billing_id  :integer
#  delivery_id :integer
#

FactoryBot.define do
  factory :order do
  end
end
