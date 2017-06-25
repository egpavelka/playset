require 'rspotify'

class Embedded::Spotify
  include DataGrabUtil

  def get_data(url)
    # Acceptable URL examples
    # https://open.spotify.com/track/7Cbxra8u8MxRlxiapl3pJZ
    # spotify:track:7Cbxra8u8MxRlxiapl3pJZ
    # Create authenticated client for API calls
    RSpotify.authenticate(Rails.application.secrets.spotify_client_id, Rails.application.secrets.spotify_client_secret)
    # API parameters from input url
    track_id = url.match(Embedded::VALID_SPOTIFY_FORMAT).captures[0]
    # Return API response
    RSpotify::Track.find(track_id)
  end

  def set_metadata(data)
    Hash[
    :title => data.name,
    :artist => data.artists[0].name,
    :album => data.album.name,
    :year => year_from_date(data.album.release_date, '%Y'),
    :media_path => data.preview_url,
    :album_art =>  file_from_url(data.album.images[0]['url'])
    ]
  end

  # Verify
  def is_track?
    data.type == 'track'
  end

  def is_streamable?
  end

end
