# frozen_string_literal: true

# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint(8)        not null, primary key
#  quantity   :integer          default(1)
#  cart_id    :bigint(8)
#  item_id    :bigint(8)
#  size_id    :bigint(8)
#  order_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe CartItem, type: :model do
  describe 'Model instantiation' do
    subject(:new_CartItem) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:id).of_type(:integer) }
      it { is_expected.to have_db_column(:quantity).of_type(:integer) }
      it { is_expected.to have_db_column(:cart_id).of_type(:integer) }
      it { is_expected.to have_db_column(:item_id).of_type(:integer) }
      it { is_expected.to have_db_column(:size_id).of_type(:integer) }
      it { is_expected.to have_db_column(:order_id).of_type(:integer) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end
  end

  context 'when testing associations' do
    it { is_expected.to belong_to(:item) }
    it { is_expected.to belong_to(:size) }
  end

  context 'when testing validations' do
    it { is_expected.to validate_presence_of(:size).on(:create) }
  end
end
