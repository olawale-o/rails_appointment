FactoryBot.define do
  sequence(:email) { |n| "test#{n}@email.com" }
  factory :user do
    email
    name { 'realuser' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
