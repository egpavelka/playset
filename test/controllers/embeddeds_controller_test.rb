require 'test_helper'

class EmbeddedsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get embeddeds_new_url
    assert_response :success
  end

  test "should get create" do
    get embeddeds_create_url
    assert_response :success
  end

end
