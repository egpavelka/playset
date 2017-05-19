require_relative 'embedded'

class Soundcloud < Embedded
  SOUNDCLOUD_CLIENT_ID = ''

  def initialize(url)
    # Unique parameters from input url (may not need)
    # @artist_path = url.match.(VALID_SOUNDCLOUD_FORMAT).captures[0]
    # @title_path = url.match.(VALID_SOUNDCLOUD_FORMAT).captures[1]
    # API url structure to get track_id
    init_api_url = "https://api.soundcloud.com/resolve.json?url=#{url}&client_id=#{SOUNDCLOUD_CLIENT_ID}"
    # This will return JSON { 'status': '...', 'location': "https://api.soundcloud.com/tracks/#{track_id}.json?client_id=#{SOUNDCLOUD_CLIENT_ID}"}
    @track_id = api_url.match(/(?<=tracks\/).*?(?=.json)/).captures[0]
    @api_url = api_call(init_api_url).values[1]["location"]
  end

  def get_data
    # Make new call to "location" url from init_api_url response
    @data = api_call(@api_url).values[1]
  end

  def auto_metadata
    => {
    :title => @data["title"],
    :artist => @data["username"],
    :album => @data["release"],
    :year => @data["release_year"],
    'album_art_url' => @data["artwork_url"]
    }
  end

  # Generate url with options for iframe
  def player_url "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/#{@track_id}&amp;color=333333&amp;auto_play=false&amp;hide_related=true&amp;show_comments=false&amp;show_user=false&amp;show_reposts=false"
  end

end
