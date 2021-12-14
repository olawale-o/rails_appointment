require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'validations' do
    let(:appointment) { build(:appointment) }

    it 'should have a booking date' do
      appointment.book_for = nil
      expect(appointment).to_not be_valid
    end

    it 'should have a note' do
      appointment.note = nil
      expect(appointment).to be_valid
    end

    it 'should have a note with length not greater than 50' do
      appointment.note = Faker::Lorem.sentence(word_count: 100)
      expect(appointment).to_not be_valid
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:doctor) }
  end
end
