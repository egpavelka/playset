require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:testuser)
    @other_user = users(:otheruser)
  end

  test "redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "redirect update when not logged in" do
    patch user_path(@user), params: { user: { name: @user.name, email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_path
  end

end
