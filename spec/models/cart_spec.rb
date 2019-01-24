# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id         :bigint(8)        not null, primary key
#  total      :decimal(, )
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'Model instantiation' do
    subject(:new_Cart) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:id).of_type(:integer) }
      it { is_expected.to have_db_column(:total).of_type(:decimal) }
      it { is_expected.to have_db_column(:user_id).of_type(:integer) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end
  end

  context 'when testing associations' do
    it { is_expected.to have_many(:cart_items) }
    it { is_expected.to have_many(:items).through(:cart_items) }
    it { is_expected.to belong_to(:user) }
  end

  context 'when testing validations' do
    it { is_expected.to validate_presence_of(:user).on(:create) }
    it { is_expected.to validate_numericality_of(:total).is_greater_than(0) }
  end
end
