require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user) { build(:user) }
    it 'name should be present' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'email should be present' do
      user.email = nil
      expect(user).to_not be_valid
    end
  end

  describe 'associations' do
    subject { build(:user) }
    it { is_expected.to have_many(:doctors).class_name('Doctor') }
    it { is_expected.to have_many(:appointments).class_name('Appointment') }
  end
end
