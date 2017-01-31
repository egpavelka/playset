require 'test_helper'

class PlaylistsPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get playlists_pages_top_url
    assert_response :success
  end

  test "should get new" do
    get playlists_pages_new_url
    assert_response :success
  end

  test "should get recommended" do
    get playlists_pages_recommended_url
    assert_response :success
  end

  test "should get favorites" do
    get playlists_pages_favorites_url
    assert_response :success
  end

end
