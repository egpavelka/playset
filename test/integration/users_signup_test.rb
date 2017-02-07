require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
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
    assert_select 'ul.error-list'
  end

  test "signup and authentication accept validation" do
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
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    # Before activation
    assert_not user.activated?
    log_in_as(user)
    assert_not is_logged_in?
    # Invalid activation token
    get edit_account_activation_path("invalid token", email: user.email)
    assert_not is_logged_in?
    # Invalid activation email
    get edit_account_activation_path(user.activation_token, email: 'wrong@email')
    assert_not is_logged_in?
    # Valid activation
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end

end
