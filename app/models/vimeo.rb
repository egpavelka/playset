require_relative 'embedded'

class Vimeo < Embedded

  attr_accessor :embedded

  def set_parameters(url)
    # API parameters from input url
    @video_id = url.match(VALID_VIMEO_FORMAT).captures[0]
    @api_url = ''
  end

  def get_data
    @data = api_call(@api_url)
  end

  def auto_metadata
    values = [{
    :title => nil,
    :artist =>  nil,
    :album => nil,
    :year => nil,
    'album_art_url' => nil
    }]
    @metadata = values[0]
  end

  # Generate url with options for iframe
  def player_url
    "https://player.vimeo.com/video/#{@video_id}?color=ffffff&title=0&byline=0&portrait=0"
  end
end
