# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id         :bigint(8)        not null, primary key
#  first_name :string
#  last_name  :string
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'Model instantiation' do
    subject(:new_profile) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:id).of_type(:integer) }
      it { is_expected.to have_db_column(:first_name).of_type(:string) }
      it { is_expected.to have_db_column(:last_name).of_type(:string) }
      it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    end
  end

  context 'when testing associations' do
    it { is_expected.to belong_to(:user) }
  end
end
