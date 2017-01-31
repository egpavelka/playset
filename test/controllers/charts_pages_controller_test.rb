require 'test_helper'

class ChartsPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get charts_top_path
    assert_response :success
  end

  test "should get new" do
    get charts_new_path
    assert_response :success
  end

  test "should get recommended" do
    get charts_recommended_path
    assert_response :success
  end

end
