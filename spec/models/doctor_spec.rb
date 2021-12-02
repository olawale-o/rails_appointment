require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'validations' do
    let(:doctor) { build(:doctor) }
    it 'should have fullname' do
      doctor.fullname = nil
      expect(doctor).to_not be_valid
    end
    it 'should have specialty' do
      doctor.specialty = nil
      expect(doctor).to_not be_valid
    end
    it 'should have city' do
      doctor.city = nil
      expect(doctor).to_not be_valid
    end
    it 'should have picture' do
      doctor.picture = nil
      expect(doctor).to_not be_valid
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:appointments) }
    it { is_expected.to belong_to(:user) }
  end
end
