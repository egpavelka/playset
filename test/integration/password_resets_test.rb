require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:testuser)
  end

  test "password resets" do
    get new_password_reset_path
    assert_template 'password_resets/new'
    # invalid username
    post password_resets_path, params: { password_reset: { username: "" } }
    assert_not flash.empty?
    assert_template 'password_resets/new'
    # valid username
    post password_resets_path, params: { password_reset: { username: @user.username } }
    assert_not_equal @user.reset_digest, @user.reload.reset_digest
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
    assert_redirected_to root_path
    # reset form
    user = assigns(:user)
    # wrong email
    get edit_password_reset_path(user.reset_token, email: "some@email.com")
    assert_redirected_to root_path
    # inactive user
    user.toggle!(:activated)
    get edit_password_reset_path(user.reset_token, email: user.email)
    assert_redirected_to root_path
    user.toggle!(:activated)
    # right email, wrong token
    get edit_password_reset_path('wrong token', email: user.email)
    assert_redirected_to root_path
    # invalid password & confirmation
    patch password_reset_path(user.reset_token), params: { email: user.email, user: { password: 'TestPassword1', password_confirmation: 'TestPassword2' } }
    assert_not flash.empty?
    # empty password
    patch password_reset_path(user.reset_token), params: { email: user.email, user: { password: '', password_confirmation: '' } }
    assert_not flash.empty?
    # valid password & confirmation
    patch password_reset_path(user.reset_token), params: { email: user.email, user: { password: 'TestPassword1', password_confirmation: 'TestPassword1' } }
    assert is_logged_in?
    assert_not flash.empty?
    assert_redirected_to user
  end

end
