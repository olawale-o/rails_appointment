require 'swagger_helper'

RSpec.describe 'Authentication API' do
  path '/v1/users' do
    post 'Create account' do
      tags 'Authentication'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :account, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string },
          password_confirmation: { type: :string }
        },
        required: %w[name email password password_confirmation]
      }

      response '201', 'account created' do
        let(:account) do
          { user: { name: 'name', email: 'wale@test.com', password: 'password', password_confirmation: 'password' } }
        end
        run_test!
      end

      response '422', 'Invalid request' do
        let(:account) do
          create(:user, email: 'wale@test.com')
          { user: { name: 'name', email: 'wale@test.com', password: 'password', password_confirmation: 'password' } }
        end
        run_test!
      end
    end
  end

  path '/v1/users/login' do
    post 'Login user' do
      tags 'Authentication'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :credentials, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }

      response '201', 'Logged in successfully' do
        let(:credentials) do
          create(:user, email: 'wale@test.com')
          { user: { email: 'wale@test.com', password: 'password' } }
        end
        run_test!
      end

      response '401', 'Invalid request' do
        let(:credentials) { { user: { email: 'unknown@test.com', password: 'password' } } }
        run_test! do
          data = JSON.parse(response.body)
          expect(data['error']).to eq('Invalid Email or password.')
        end
      end
    end
  end

  path '/v1/users/logout' do
    login_user
    delete 'Logout user' do
      security [Bearer: []]
      consumes 'application/json'

      response '204', 'logout successfully' do
        let(:Authorization) { @auth_headers['Authorization'] }
        run_test!
      end
    end
  end
end
