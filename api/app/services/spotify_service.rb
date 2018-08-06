require 'rspotify'

class SpotifyService
  include DataGrabUtil
  attr_accessor :url, :data
  # Acceptable URL examples
  # https://open.spotify.com/track/7Cbxra8u8MxRlxiapl3pJZ
  # spotify:track:7Cbxra8u8MxRlxiapl3pJZ

  def initialize(params)
    @url = params[:url]
    @data = self.call
  end

  def call
    track_id = @url.match(EmbeddingUtil::valid_spotify_format)[2]
    secure_client
    RSpotify::Track.find(track_id)
  end

  def set_metadata
    Hash[
      :metadata => {
        title: @data.name,
        artist: @data.artists[0].name,
        album: @data.album.name,
        media_path: @data.preview_url
      },
      :year_params => [@data.album.release_date, '%Y'],
      :album_art_params => @data.album.images[0]['url']
    ]
  end

  def is_track?
    @data.type == 'track'
  end

  def is_preview?
    true
  end

  private

  def secure_client
    RSpotify.authenticate(Rails.application.credentials.spotify_client_id, Rails.application.credentials.spotify_client_secret)
  end

end
