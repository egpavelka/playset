require 'test_helper'

class TracksControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "| playsette"
  end

  test "should get top" do
    get root_path
    assert_response :success
    assert_select "title", "top #{@base_title}"
  end
  
end
