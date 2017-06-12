require 'rspotify'

class Embedded::Spotify
  include JsonUtil

  def get_data(url)
    # Acceptable URL examples
    # https://open.spotify.com/track/7Cbxra8u8MxRlxiapl3pJZ
    # spotify:track:7Cbxra8u8MxRlxiapl3pJZ
    # Create authenticated client for API calls
    RSpotify.authenticate(Rails.application.secrets.spotify_client_id, Rails.application.secrets.spotify_client_secret)
    # API parameters from input url
    @track_id = url.match(Embedded.VALID_SPOTIFY_FORMAT).captures[0]
    # Return API response
    RSpotify::Track.find(@track_id)
  end

  def set_metadata(data)
    # Hash to return for track_params
    values = [{
    'text_data' => {
      :title => data.name,
      :artist => data.artists[0].name,
      :album => data.album.name,
      :year => year_from_date(data.album.release_date, '%Y')
      },
    'album_art_url' => data.album.images[0]['url']
    },
    self.player_url]
    return values
  end

  # Generate url with options for iframe
  def player_url
    "https://open.spotify.com/embed?uri=spotify:track:#{@track_id}&theme=white&view=list"
  end

  # Verify
  def is_track?
    data.type == 'track'
  end

end
