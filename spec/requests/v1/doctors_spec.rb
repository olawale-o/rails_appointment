require 'swagger_helper'

RSpec.describe 'doctors', type: :request do
  login_user
  path '/v1/doctors' do
    get 'List all doctors' do
      tags 'Doctors'
      security [Bearer: []]
      produces 'application/json'
      response '200', 'Successful' do
        let(:Authorization) { @token }
        run_test!
      end
    end
    post 'Create a doctor' do
      tags 'Doctors'
      security [Bearer: []]
      consumes 'multipart/form-data'
      parameter name: :doctor, in: :formData, schema: {
        type: :object,
        properties: {
          fullname: { type: :string }, city: { type: :string },
          picture: { type: :file }, specialty: { type: :string }
        },
        required: %w[fullname city specialty picture]
      }
      response '201', 'Successful' do
        let(:Authorization) { @token }
        let(:file) { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images', 'bruno.jpg')) }
        let(:doctor) do
          { fullname: 'Dr. Juan', city: 'Cochabamba', specialty: 'Pediatria', picture: file }
        end
        run_test!
      end
    end
  end
  path '/v1/doctors/{id}' do
    get 'Retrieve a doctor' do
      tags 'Doctors'
      security [Bearer: []]
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '200', 'Successful' do
        let(:Authorization) { @token }
        schema type: :object,
               properties: {
                 id: { type: :integer }
               },
               required: %w[id]
        let(:id) { create(:doctor, user: @user).id }
        run_test!
      end
    end
    delete 'Retrieve a doctor' do
      tags 'Doctors'
      security [Bearer: []]
      produces 'application/json'
      parameter name: :id, in: :path, type: :string
      response '204', 'Successful' do
        let(:Authorization) { @token }
        let(:id) { create(:doctor, user: @user).id }
        run_test! do |response|
          expect(response.body).to be_empty
        end
      end
    end
  end
end
