# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id                  :bigint(8)        not null, primary key
#  name                :string
#  image_url           :string
#  description         :text
#  price               :decimal(7, 2)
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
  describe 'Model instantiation' do
    subject(:new_item) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:id).of_type(:integer) }
      it { is_expected.to have_db_column(:name).of_type(:string) }
      it { is_expected.to have_db_column(:image_url).of_type(:string) }
      it { is_expected.to have_db_column(:description).of_type(:text) }
      it { is_expected.to have_db_column(:price).of_type(:decimal).with_options( precision: 7, scale: 2) }
      it { is_expected.to have_db_column(:has_discount).of_type(:boolean).with_options(default: false) }
      it { is_expected.to have_db_column(:male).of_type(:boolean) }
      it { is_expected.to have_db_column(:female).of_type(:boolean) }
      it { is_expected.to have_db_column(:discount_percentage).of_type(:integer).with_options(default: 0) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end
  end

  context 'when testing associations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to belong_to(:brand) }
    it { is_expected.to have_many(:cart_items) }
    it { is_expected.to have_many(:stocks) }
    it { is_expected.to have_many(:sizes).through(:stocks) }
  end

  context 'when testing validations' do
    it { is_expected.to validate_presence_of(:price).on(:create) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:discount_percentage).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(100) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to allow_value("Jeans Levi's").for(:name) }
    it { is_expected.not_to allow_value("Jeans Levi's\n").for(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(30) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_least(10).is_at_most(500) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:brand) }
  end

  context 'when destroying an item' do
    let(:item) { create(:item) }

    it 'destroys its stocks upon deletion' do
      create_list(:stock, 1, item: item)
      expect { item.destroy }.to change(Stock, :count).from(item.stocks.count).to(0)
    end

    it "doesn't destroy its size upon deletion" do
      create_list(:stock, 1, item: item)
      expect { item.destroy }.not_to change(Size, :count)
    end
  end

  context 'when creating an item' do
    before do
      FactoryBot.create(:item, name: "Jeans")
    end

    it 'returns items matching with name' do
      expect(Item.where(name: "Jeans").size).to eq(1)
    end

    it 'returns nothing when name doesnt match' do
      expect(Item.where(name: "Jean's").size).to eq(0)
    end
  end
end
