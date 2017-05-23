require_relative 'embedded'

class Spotify < Embedded
  SPOTIFY_CLIENT_ID = '05343128829c43e19407fc13849136c8'

  def get_data(url)
    # API parameters from input url
    @track_id = url.match.(VALID_SPOTIFY_FORMAT).captures[1]
      # (first match group is type (uri vs url), second is track id)
    # API url structure with parameters
    api_url = "https://api.spotify.com/v1/tracks/#{@track_id}"
    # Return API response
    api_call(api_url)
  end

  def get_metadata(data)
    values = [{
    :title => data["name"],
    :artist => data.values["artists"][0]["name"],
    :album => data["album"]["name"],
    :year => '',
    'album_art_url' => data["album"]["images"][0]["url"]
    },
    player_url]
    values
  end

  # Generate url with options for iframe
  def player_url
    "https://open.spotify.com/embed?uri=spotify:track:#{@track_id}&theme=white&view=list"
  end

  # Verify
  def matches_link?
  end

  def is_track?
  end

end
