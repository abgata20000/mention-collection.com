module Requests
  module SigninMacros
    def signin_as_user(user_account = create(:user_account))
      post "/users/session", params: { "user_session[email]" => user_account.email, "user_session[password]" => user_account.password }
    end

    def signin_as_partner(user_account = create(:partner)); end

    def signin_as_staff(staff = create(:staff)); end
  end
end
