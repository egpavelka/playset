require 'test_helper'

class AccountPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get account_pages_login_url
    assert_response :success
  end

  test "should get signup" do
    get account_pages_signup_url
    assert_response :success
  end

  test "should get public-profile" do
    get account_pages_public-profile_url
    assert_response :success
  end

  test "should get my-profile" do
    get account_pages_my-profile_url
    assert_response :success
  end

  test "should get manage-profile" do
    get account_pages_manage-profile_url
    assert_response :success
  end

  test "should get manage-account" do
    get account_pages_manage-account_url
    assert_response :success
  end

  test "should get account-home" do
    get account_pages_account-home_url
    assert_response :success
  end

end
