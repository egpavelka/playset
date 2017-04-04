class Embedded < ApplicationRecord
  has_one :media_source, as: :media
  has_one :track, through: :media_sources

  VALID_BANDCAMP_FORMAT = /^[https?:\/\/]+([a-z]+)\.bandcamp\.com\/track\/([^#\&\?\/]*)/i
  # https://ARTIST.bandcamp.com/track/TITLE

  VALID_SOUNDCLOUD_FORMAT = /^[https?:\/\/\soundcloud\.com]+\/([^#\&\?\/]*)\/([^#\&\?\/]*)/
  # https://soundcloud.com/ARTIST/TITLE

  VALID_SPOTIFY_FORMAT = /^(spotify:track:|https?:\/\/[a-z]+\.spotify\.com\/track\/)([^#\&\?\/]*)/i
  # spotify:track:2TpxZ7JUBn3uw46aR7qd6V
  # http://open.spotify.com/track/2TpxZ7JUBn3uw46aR7qd6V (or https)

  # Assign to service so API can be called
  def assign_api
    embedded_sources = {
      VALID_BANDCAMP_FORMAT => :bandcamp,
      VALID_SOUNDCLOUD_FORMAT => :soundcloud,
      VALID_SPOTIFY_FORMAT => :spotify
    }
  end

end

class Bandcamp < Embedded

  def artist_path
    source_path.match.(VALID_BANDCAMP_FORMAT).captures[0]
    # regex conversion to lookup syntax
  end

  def title_path
    source_path.match.(VALID_BANDCAMP_FORMAT).captures[1]
    # regex conversion to lookup syntax
  end

end

class Soundcloud < Embedded

  def artist_path
    source_path.match.(VALID_SOUNDCLOUD_FORMAT).captures[0]
    # regex conversion to lookup syntax
  end

  def title_path
    source_path.match.(VALID_SOUNDCLOUD_FORMAT).captures[1]
    # regex conversion to lookup syntax
  end

end

class Spotify < Embedded

  def track_id
    source_path.match.(VALID_YT_FORMAT).captures[1]
    # (first match group is type (uri vs url), second is track id)
  end

end
