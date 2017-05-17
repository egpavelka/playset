class Embedded < ApplicationRecord
  has_one :media_source, as: :media
  has_one :track, through: :media_sources

  before_validation :set_embedded_source

  def set_embedded_source
    if source_path.validate(VALID_BANDCAMP_FORMAT)
      Embedded::Bandcamp.new
    elsif source_path.validates(VALID_SOUNDCLOUD_FORMAT)
      Embedded::Soundcloud.new
    elsif source_path.validates(VALID_SPOTIFY_FORMAT)
      Embedded::Spotify.new
    else
    end
  end

  VALID_BANDCAMP_FORMAT = /^[https?:\/\/]+([a-z]+)\.bandcamp\.com\/track\/([^#\&\?\/]*)/i
  # https://ARTIST.bandcamp.com/track/TITLE

  VALID_SOUNDCLOUD_FORMAT = /^[https?:\/\/\soundcloud\.com]+\/([^#\&\?\/]*)\/([^#\&\?\/]*)/
  # https://soundcloud.com/ARTIST/TITLE

  VALID_SPOTIFY_FORMAT = /^(spotify:track:|https?:\/\/[a-z]+\.spotify\.com\/track\/)([^#\&\?\/]*)/i
  # spotify:track:2TpxZ7JUBn3uw46aR7qd6V
  # http://open.spotify.com/track/2TpxZ7JUBn3uw46aR7qd6V (or https)

end

class Bandcamp < Embedded

  # API parameters from input url
  def artist_path
    source_path.match.(VALID_BANDCAMP_FORMAT).captures[0]
    # regex conversion to lookup syntax
  end

  def title_path
    source_path.match.(VALID_BANDCAMP_FORMAT).captures[1]
    # regex conversion to lookup syntax
  end

  # API url structure with parameters
  def api_url
  end

end

class Soundcloud < Embedded

  # API parameters from input url
  def artist_path
    source_path.match.(VALID_SOUNDCLOUD_FORMAT).captures[0]
    # regex conversion to lookup syntax
  end

  def title_path
    source_path.match.(VALID_SOUNDCLOUD_FORMAT).captures[1]
    # regex conversion to lookup syntax
  end

  # API url structure with parameters
  def api_url
  end

end

class Spotify < Embedded

  # API parameters from input url
  def track_id
    source_path.match.(VALID_YT_FORMAT).captures[1]
    # (first match group is type (uri vs url), second is track id)
  end

  # API url structure with parameters
  def api_url
  end

end
