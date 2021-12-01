class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  has_many :doctors
  has_many :appointments
end
