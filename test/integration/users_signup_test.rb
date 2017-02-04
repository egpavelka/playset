require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "signup reject validation" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: {
          username: "",
          name: "",
          email: "invalid@user",
          password: "this",
          password_confirmation: "that"
        } }
    end
    assert_template 'users/new'
  end
end
