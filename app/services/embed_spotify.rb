require 'rspotify'

class SpotifyService
  include DataGrabUtil
  include EmbeddingUtil
  # Acceptable URL examples
  # https://open.spotify.com/track/7Cbxra8u8MxRlxiapl3pJZ
  # spotify:track:7Cbxra8u8MxRlxiapl3pJZ

  def get_data(url)
    track_id = url.match(:VALID_SPOTIFY_FORMAT)[0]
    secure_client
    response = RSpotify::Track.find(track_id)
    response && response.is_track? ? return response : nil
  end

  def set_metadata
    Hash[
    :title => name,
    :artist => artists[0].name,
    :album => album.name,
    :year => year_from_date(album.release_date, '%Y'),
    :media_path => preview_url,
    :preview => true,
    :album_art =>  file_from_url(album.images[0]['url'])
    ]
  end

  # Verify
  def is_track?
    type == 'track'
  end

  def is_preview?
    true
  end

  def secure_client
    RSpotify.authenticate(Rails.application.secrets.spotify_client_id, Rails.application.secrets.spotify_client_secret)
  end

end
