require 'test_helper'

class ChartsPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get charts_pages_top_url
    assert_response :success
  end

  test "should get new" do
    get charts_pages_new_url
    assert_response :success
  end

  test "should get recommended" do
    get charts_pages_recommended_url
    assert_response :success
  end

end
