require 'test_helper'

class EmbeddedsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get embeddeds_new_url
    assert_response :success
  end

end
