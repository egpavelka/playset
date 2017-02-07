require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:testuser)
  end

  test "edit failure" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "", email: "not@valid", profile_bio: "A" * 501, password: "nota", password_confirmation: "match" } }
    assert_template 'users/edit'
  end

  test "edit success" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "New Name"
    email = "test@testemail.com"
    bio = "Stuff about me"
    patch user_path(@user), params: { user: { name: name, profile_bio: bio, email: email, password: "", password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end

end
