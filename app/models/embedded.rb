class Embedded < ApplicationRecord
  has_one :media_source, as: :media
  has_one :track, through: :media_sources

  before_validation :set_embedded_source
  # Player_url will be generated to insert into iframe
  # Playback_function will map play and stop from embedded player to uniform player
  store :source_settings, accessors: [ :player_url, :playback_function]

  ####################
  # SETUP: SOURCES,
  # LINK CHECK
  ####################

  # Regex patterns for supported service links
  VALID_VIMEO_FORMAT = /^[https?:\/\/vimeo\.com\/]+([^#\&\?\/]*)/i
      # https://vimeo.com/209507887
  VALID_YOUTUBE_FORMAT = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i
      # https://www.youtube.com/watch?v=8KkW8Ul7Q1I
      # https://youtu.be/8KkW8Ul7Q1I?t=1m
  VALID_BANDCAMP_FORMAT = /^[https?:\/\/]+([a-z]+)\.bandcamp\.com\/track\/([^#\&\?\/]*)/i
      # https://ARTIST.bandcamp.com/track/TITLE
  VALID_SOUNDCLOUD_FORMAT = /^[https?:\/\/\soundcloud\.com]+\/([^#\&\?\/]*)\/([^#\&\?\/]*)/
      # https://soundcloud.com/ARTIST/TITLE
  VALID_SPOTIFY_FORMAT = /^(spotify:track:|https?:\/\/[a-z]+\.spotify\.com\/track\/)([^#\&\?\/]*)/i
      # spotify:track:2TpxZ7JUBn3uw46aR7qd6V
      # http://open.spotify.com/track/2TpxZ7JUBn3uw46aR7qd6V (or https)

  # Check that source_path is in a valid format for a supported service and initialize variables for that service.
  before_validation :set_embedded_source

  def set_embedded_source
    if source_path.validate(VALID_VIMEO_FORMAT)
      Embedded::Vimeo.new
    elsif source_path.validates(VALID_YOUTUBE_FORMAT)
      Embedded::YouTube.new
    elsif source_path.validate(VALID_BANDCAMP_FORMAT)
      Embedded::Bandcamp.new
    elsif source_path.validates(VALID_SOUNDCLOUD_FORMAT)
      Embedded::Soundcloud.new
    elsif source_path.validates(VALID_SPOTIFY_FORMAT)
      Embedded::Spotify.new
    else
      flash[:error] = "Please submit a link to a single track or video from a supported site."
    end
  end

end
