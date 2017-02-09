require 'test_helper'
class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'tracks/index'
    assert_select "a[href=?]", root_path, count: 4
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", help_path

    get signup_path
    assert_select "title", full_title("sign up")
  end
end
