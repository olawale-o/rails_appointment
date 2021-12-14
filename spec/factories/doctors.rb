FactoryBot.define do
  sequence(:fullname) { |n| "Doctor #{n}" }
  factory :doctor do
    fullname
    city { 'City' }
    specialty { 'Nurse' }
    user
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'bruno.jpg')) }
  end
end
