class Appointment < ApplicationRecord
  validates :book_for, presence: true
  validates :book_for, uniqueness: { scope: %i[user_id doctor_id] }

  belongs_to :user
  belongs_to :doctor
end
