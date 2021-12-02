module Helper
  module ApiSpec
    def login_user
      before(:each) do
        @user = create :user
        auth_headers = Devise::JWT::TestHelpers.auth_headers({}, @user)
        @token = auth_headers['Authorization']
      end
    end
  end
end
