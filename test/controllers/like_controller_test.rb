require 'test_helper'

class LikeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get like_index_url
    assert_response :success
  end

  test "should get new" do
    get like_new_url
    assert_response :success
  end

end
