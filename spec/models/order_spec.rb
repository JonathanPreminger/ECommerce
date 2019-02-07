# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id               :bigint(8)        not null, primary key
#  total            :decimal(, )
#  user_id          :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  status           :boolean          default(FALSE)
#  billing_address  :text
#  delivery_address :text
#  first_name       :text
#  last_name        :text
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Model instantiation' do
    subject(:new_Order) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:id).of_type(:integer) }
      it { is_expected.to have_db_column(:total).of_type(:decimal) }
      it { is_expected.to have_db_column(:user_id).of_type(:integer) }
      it { is_expected.to have_db_column(:billing_address).of_type(:text) }
      it { is_expected.to have_db_column(:delivery_address).of_type(:text) }
      it { is_expected.to have_db_column(:first_name).of_type(:text) }
      it { is_expected.to have_db_column(:last_name).of_type(:text) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end
  end

  context 'when testing associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'when testing validations' do
    it { is_expected.to validate_presence_of(:billing_address).on(:create) }
    it { is_expected.to validate_presence_of(:delivery_address).on(:create) }
    it { is_expected.to validate_presence_of(:first_name).on(:create) }
    it { is_expected.to validate_presence_of(:last_name).on(:create) }
    it { is_expected.to validate_presence_of(:total).on(:create) }
  end

  context 'when testing last 3 orders' do
    it 'extracts 3 orders' do
      create_list(:order_to_be_treated, 10)
      expect(Order.last_3_orders.count).to eq(3)
    end

    it 'gives the last 3 orders' do
      order1 = create(:order_to_be_treated)
      order2 = create(:order_to_be_treated)
      order3 = create(:order_to_be_treated)
      expect(Order.last_3_orders).to match_array([order3, order2, order1])
    end
  end

  context "when getting the name of the one who's ordering" do
    it 'gets the firstname and lastname' do
      order = build(:order, first_name: "Juliette", last_name: "Kikou")
      expect(order.user_name).to eq("Juliette Kikou")
    end
  end

  context "when testing treatment of the order" do
    it 'returns Treated when treated' do
      order = build(:order_treated)
      expect(order.treatment).to eq("Treated")
    end

    it 'returns Pending when not treated' do
      order = build(:order_to_be_treated)
      expect(order.treatment).to eq("Pending")
    end
  end

  context "when testing treatment?" do
    it "returns true when order has not been treated" do
      order = build(:order_to_be_treated)
      expect(order.treatment?).to eq(true)
    end

    it "returns false when order has been treated" do
      order = build(:order_treated)
      expect(order.treatment?).to eq(false)
    end
  end
end
