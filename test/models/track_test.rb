require 'test_helper'

class TrackTest < ActiveSupport::TestCase

  def setup
    @user = users(:testuser)
    @track = @user.tracks.build(url_src: "https://www.youtube.com/watch?v=WMljPLpFUMA", user_id: @user.id)
  end

  test "should be valid" do
    assert @track.valid?
  end

  test "user_id should be present" do
    @track.user_id = nil
    assert_not @track.valid?
  end

end
