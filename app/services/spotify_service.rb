require 'rspotify'

class SpotifyService
  include DataGrabUtil
  include EmbeddingUtil
  attr_accessor :url
  # Acceptable URL examples
  # https://open.spotify.com/track/7Cbxra8u8MxRlxiapl3pJZ
  # spotify:track:7Cbxra8u8MxRlxiapl3pJZ

  def initialize(params)
    @url = params[:url]
  end

  def call
    track_id = @url.match(EmbeddingUtil::valid_spotify_format)[2]
    puts track_id
    secure_client
    RSpotify::Track.find(track_id)
  end

  def self.set_metadata(data)
    Hash[
      :metadata => {
        title: data.name,
        artist: data.artists[0].name,
        album: data.album.name,
        year: DataGrabUtil::year_from_date(data.album.release_date, '%Y'),
        media_path: data.preview_url,
        album_art: DataGrabUtil::file_from_url(data.album.images[0]['url'])
      }
    ]
  end

  def self.is_track?(data)
    data.type == 'track'
  end

  def self.is_preview?(data)
    true
  end

  private

  def secure_client
    RSpotify.authenticate(Rails.application.secrets.spotify_client_id, Rails.application.secrets.spotify_client_secret)
  end

end
