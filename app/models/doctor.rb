class Doctor < ApplicationRecord
  validates :fullname, :specialty, :picture, :city, presence: true
  validates :fullname, uniqueness: { scope: :user_id }

  belongs_to :user
  has_many :appointments, dependent: :destroy
  has_one_attached :picture
end
