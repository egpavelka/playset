require_relative 'embedded'

class Spotify < Embedded
  client_id =  Rails.application.secrets.spotify_client_id
  client_secret =  Rails.application.secrets.spotify_client_secret


  def get_data(url)
    # Acceptable URL examples
    # https://open.spotify.com/track/4uLU6hMCjMI75M1A2tKUQC
    # spotify:track:4uLU6hMCjMI75M1A2tKUQC
    # API parameters from input url
    @track_id = url.match.(VALID_SPOTIFY_FORMAT).captures[0]
    # API url structure with parameters
    api_url = "https://api.spotify.com/v1/tracks/#{@track_id}"
    # Return API response
    api_call(api_url)
  end

  def get_metadata(data)
    values = [{
    :title => data['name'],
    :artist => data.values['artists'][0]['name'],
    :album => data['album']['name'],
    :year => '',
    'album_art_url' => data['album']['images'][0]['url']
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
