require 'swagger_helper'

RSpec.describe 'appointments', type: :request do
  login_user
  path '/v1/appointments' do
    post 'Creates a new appointment' do
      tags 'Appointments'
      security [Bearer: []]
      consumes 'application/json'
      parameter name: :appointment, in: :body, schema: {
        type: :object,
        properties: { note: { type: :string }, book_for: { type: :string }, doctor_id: { type: :integer } },
        required: %w[note book_for doctor_id]
      }

      response '201', 'appointment created' do
        let(:Authorization) { @token }
        let(:appointment) do
          doc = create(:doctor)
          { note: 'test', book_for: '2020-01-01T00:00:00', doctor_id: doc.id }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:Authorization) { @token }
        let(:appointment) do
          doc = create(:doctor)
          create(:appointment, doctor: doc, user: @user, book_for: '2020-01-01T00:00:00')
          { note: 'test', book_for: '2020-01-01T00:00:00', doctor_id: doc.id }
        end
        run_test!
      end
    end
  end
  path '/v1/appointments/{id}' do
    delete 'Deletes an appointment' do
      tags 'Appointments'
      security [Bearer: []]
      parameter name: :id, in: :path, type: :integer

      response '204', 'appointment deleted' do
        let(:Authorization) { @token }
        let(:id) { create(:appointment, user: @user).id }
        run_test! do |response|
          expect(response.body).to be_empty
        end
      end
    end
  end
end
