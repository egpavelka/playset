require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "signup accept validation" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: {
          username: "valid_username",
          name: "Valid Name",
          email: "valid@email.com",
          password: "ValidPW1",
          password_confirmation: "ValidPW1"
        } }
    end
    follow_redirect!
    assert_template 'users/show'
  end

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
    assert_select 'div#error_explanation'
    assert_select 'li.error-list'
  end

end
