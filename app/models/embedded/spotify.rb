require 'rspotify'

class Embedded::Spotify

  def get_data(url)
    # Acceptable URL examples
    # https://open.spotify.com/track/4uLU6hMCjMI75M1A2tKUQC
    # spotify:track:4uLU6hMCjMI75M1A2tKUQC
    # Create authenticated client for API calls
    RSpotify.authenticate(Rails.application.secrets.spotify_client_id, Rails.application.secrets.spotify_client_secret)
    # API parameters from input url
    @track_id = url.match($VALID_SPOTIFY_FORMAT).captures[0]
    # Return API response
    RSpotify::Track.find(@track_id)
  end

  def get_metadata(data)
    # Format date
    year_from_date = Date.strptime(data.album.release_date, '%Y').year

    values = [{
    'text_data' => {
      :title => data.name,
      :artist => data.artists[0].name,
      :album => data.album.name,
      :year => year_from_date
      },
    'album_art_url' => data.album.images[0]['url']
    },
    self.player_url]

    values
  end

  # Generate url with options for iframe
  def player_url
    "https://open.spotify.com/embed?uri=spotify:track:#{@track_id}&theme=white&view=list"
  end

  # Verify
  def matches_link?
    source_path == data.external_urls['spotify'] || data.uri
  end

  def is_track?
    data.type == 'track'
  end

end
