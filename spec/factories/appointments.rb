FactoryBot.define do
  factory :appointment do
    book_for { Faker::Time.forward(days: 5, period: :evening, format: :long) }
    user
    doctor
    note { Faker::Lorem.sentence }
  end
end
