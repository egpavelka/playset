require_relative 'embedded'

class Youtube < Embedded
  YOUTUBE_API_KEY = 'AIzaSyD_-CYPWp2DgQ6VeEqPpZtCgQksSWaUU14'

  def get_data(url)
    # API parameters from input url
    @video_id = url.match.(VALID_YT_FORMAT).captures[1]
      # First match group will be 'watch?v=' or '&v='
      # Second match group will be video ID
    api_url = ''
    api_call(api_url)
  end

  def get_metadata(data)
    values = [{
    :title => nil,
    :artist => nil,
    :album => nil,
    :year => nil,
    :album_art => nil
    },
    player_url]
    values
  end

  # Generate url with options for iframe
  def player_url
    "https://www.youtube.com/embed/#{@video_id}?enablejsapi=1&color=white&controls=0&playsinline=1&showinfo=0&rel=0"
  end

  # Verify
  def matches_link?
  end

  def is_track?
  end

end
