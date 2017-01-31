require 'test_helper'

class AccountPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get login_path
    assert_response :success
  end

  test "should get signup" do
    get signup_path
    assert_response :success
  end

  test "should get publicprofile" do
    get profile_path
    assert_response :success
  end

  test "should get myprofile" do
    get profile_view_path
    assert_response :success
  end

  test "should get manageprofile" do
    get profile_edit_path
    assert_response :success
  end

  test "should get manageaccount" do
    get account_edit_path
    assert_response :success
  end

  test "should get accounthome" do
    get account_path
    assert_response :success
  end

end
