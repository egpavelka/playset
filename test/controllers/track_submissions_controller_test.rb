require 'test_helper'

class TrackSubmissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get add_source" do
    get track_submissions_add_source_url
    assert_response :success
  end

  test "should get add_media" do
    get track_submissions_add_media_url
    assert_response :success
  end

  test "should get publish" do
    get track_submissions_publish_url
    assert_response :success
  end

end
