require 'test_helper'

class PlaylistsPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get playlists_top_path
    assert_response :success
  end

  test "should get new" do
    get playlists_new_path
    assert_response :success
  end

  test "should get recommended" do
    get playlists_recommended_path
    assert_response :success
  end

  test "should get favorites" do
    get playlists_favorites_path
    assert_response :success
  end

end
