require 'devise'

module Helper
  module ApiSpec
    def login_user
      before(:each) do
        @user = create(:user)
        headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
        auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
        puts auth_headers
      end
    end
  end
end
