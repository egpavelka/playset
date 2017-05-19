require_relative 'embedded'

class Youtube < Embedded
  YOUTUBE_API_KEY = 'AIzaSyD_-CYPWp2DgQ6VeEqPpZtCgQksSWaUU14'

  def set_parameters(url)
    # API parameters from input url
    @video_id = url.match.(VALID_YT_FORMAT).captures[1]
      # First match group will be 'watch?v=' or '&v='
      # Second match group will be video ID
    @api_url = ''
  end

  def get_data
    @data = api_call(@api_url)
  end

  def auto_metadata
    values = [{
    :title => '',
    :artist => '',
    :album => '',
    :year => '',
    'album_art_url' => ''
    }]
    @metadata = values[0]
  end

  # Generate url with options for iframe
  def player_url
    ""
  end
end
