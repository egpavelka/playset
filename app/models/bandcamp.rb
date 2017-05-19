require_relative 'embedded'

class Bandcamp < Embedded

  def set_parameters(url)
    # API parameters from input url
    @artist_path = url.match.(VALID_BANDCAMP_FORMAT).captures[0]
    @title_path = url.match.(VALID_BANDCAMP_FORMAT).captures[1]
    super
  end

  def get_data
    # Scrape the page elements
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
    "https://bandcamp.com/EmbeddedPlayer/album=#{@album_id}/size=small/bgcol=ffffff/linkcol=333333/artwork=none/track=#{@track_id}/transparent=true/"
  end
end
