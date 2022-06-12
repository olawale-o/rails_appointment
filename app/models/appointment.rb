class Appointment < ApplicationRecord
  validates :book_for, presence: true
  validates :book_for, uniqueness: { scope: %i[user_id doctor_id] }
  validates :note, allow_blank: true, length: { maximum: 50 }

  belongs_to :user
  belongs_to :doctor

  delegate :picture, to: :doctor, prefix: true
end
