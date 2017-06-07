class Embedded::Vimeo

  attr_accessor :embeddeds

  def get_data(url)
    # API parameters from input url
    @video_id = url.match(VALID_VIMEO_FORMAT).captures[0]
    api_url = ''
    # Return API response
    api_call(api_url)
  end

  def get_metadata(data)
    values = [{
    :title => nil,
    :artist =>  nil,
    :album => nil,
    :year => nil,
    :album_art => nil
    },
    self.player_url]
    values
  end

  # Generate url with options for iframe
  def player_url
    "https://player.vimeo.com/video/#{@video_id}?color=ffffff&title=0&byline=0&portrait=0"
  end

  # Verify
  def matches_link?
  end

  def is_track?
  end

end
